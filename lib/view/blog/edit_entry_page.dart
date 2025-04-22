import 'dart:developer' as developer;
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:javier_website/core/l10n/app_locale.dart';
import 'package:javier_website/model/entry.dart';
import 'package:javier_website/view/themes/app_theme.dart';
import 'package:javier_website/view/widgets/common_scaffold.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:javier_website/viewmodel/blog/entries_view_model.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditEntryPage extends ConsumerStatefulWidget {
  final Entry entry;
  const EditEntryPage({super.key, required this.entry});

  @override
  ConsumerState<EditEntryPage> createState() => _EditEntryPageState();
}

class _EditEntryPageState extends ConsumerState<EditEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _contentHtmlController = HtmlEditorController();
  final _bannerImageUrlController = TextEditingController();
  final _tagsController = StringTagController<String>();
  late double _distanceToField;
  File? _selectedImage;
  FilePickerResult? _selectedImageWeb;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    _titleController.text = widget.entry.title;
    _subtitleController.text = widget.entry.subtitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return CommonScaffold(
      showBackButton: true,
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * .10, 8, screenWidth * .10, 8),
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: screenWidth * .80,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  if (_selectedImageWeb != null)
                    Image.memory(
                      _selectedImageWeb!.files.single.bytes!,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  if (widget.entry.bannerImageUrl.isNotEmpty && _selectedImageWeb == null)
                    FutureBuilder(
                      future: _buildFirestorageFromImageName(widget.entry.id, widget.entry.bannerImageUrl),
                      builder: (context, snapshot) => snapshot.hasData
                          ? Image.network(snapshot.data.toString())
                          : const CircularProgressIndicator(),
                    ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: localizations.entryTitle,
                      filled: true,
                      fillColor: AppTheme.lightTheme.colorScheme.primary,
                      labelStyle: TextStyle(fontFamily: 'Roboto', color: AppTheme.lightTheme.colorScheme.secondary),
                    ),
                    style: const TextStyle(fontFamily: 'Roboto'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations.pleaseEnterTitle;
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _subtitleController,
                    decoration: InputDecoration(
                      labelText: localizations.subtitle,
                      filled: true,
                      fillColor: AppTheme.lightTheme.colorScheme.primary,
                      labelStyle: TextStyle(fontFamily: 'Roboto', color: AppTheme.lightTheme.colorScheme.secondary),
                    ),
                    style: const TextStyle(fontFamily: 'Roboto'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations.pleaseEnterSubtitle;
                      }
                      return null;
                    },
                  ),
                  _htmlEditorField(widget.entry.content),
                  const SizedBox(height: 2),
                  if (_selectedImage != null)
                    kIsWeb
                        ? Image.network(
                            _selectedImage!.path,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            _selectedImage!,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                  if (_selectedImage != null) const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text(localizations.pickAnImage),
                  ),
                  const SizedBox(height: 2),
                  _tagsField(widget.entry.tags),
                  ElevatedButton(
                    style: AppTheme.lightTheme.elevatedButtonTheme.style,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (kIsWeb) {
                          if (_selectedImageWeb?.files.single.bytes != null) {
                            Uint8List imageBytes = _selectedImageWeb!.files.single.bytes!;
                            String fileName = _selectedImageWeb!.files.single.name;

                            final storageRef =
                                FirebaseStorage.instance.ref().child('blog/${widget.entry.id}/$fileName');

                            await storageRef.putData(imageBytes);

                            developer.log('✅ Upload completo: ${storageRef.fullPath}');
                          }
                        } else {
                          if (_selectedImage != null) {
                            // Upload the image to Firestore
                            final storageRef = FirebaseStorage.instance
                                .ref()
                                .child('blog/${widget.entry.id}/${_selectedImage!.path.split('/').last}');
                            await storageRef.putFile(_selectedImage!);
                          }
                        }

                        String imageName;
                        if (kIsWeb) {
                          imageName = _selectedImageWeb?.files.single.name ?? '';
                        } else {
                          imageName = _selectedImage?.path.split('/').last ?? '';
                        }

                        var tags = _tagsController.getTags ?? <String>[];
                        final entryToUpdate = Entry(
                          id: widget.entry.id,
                          title: _titleController.text,
                          subtitle: _subtitleController.text,
                          content: (await _contentHtmlController.getText()),
                          createdAt: widget.entry.createdAt,
                          bannerImageUrl: imageName,
                          tags: tags,
                          comments: widget.entry.comments,
                        );
                        ref.read(entryViewModelProvider(entryToUpdate.id).notifier).updateEntry(entryToUpdate);
                        if (context.mounted) {
                          context.pop();
                        }
                      }
                    },
                    child: Text(localizations.saveEntry),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _bannerImageUrlController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  static Future<String?> _buildFirestorageFromImageName(String entryId, String imageName) async {
    try {
      // Referencia al archivo en Firebase Storage
      final ref = FirebaseStorage.instance.ref().child('blog/$entryId/$imageName');

      // Obtener la URL de descarga
      var url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      developer.log('Error obteniendo la URL de la imagen($entryId/$imageName): $e');
    }
    return null;
  }

  Widget _tagsField(List<String> tags) {
    return TextFieldTags<String>(
      textfieldTagsController: _tagsController,
      initialTags: tags,
      textSeparators: const [' ', ','],
      letterCase: LetterCase.normal,
      validator: (String tag) {
        if (_tagsController.getTags!.contains(tag)) {
          return 'You\'ve already entered that';
        }
        return null;
      },
      inputFieldBuilder: (context, inputFieldValues) {
        return TextField(
          onTap: () {
            _tagsController.getFocusNode?.requestFocus();
          },
          controller: inputFieldValues.textEditingController,
          focusNode: inputFieldValues.focusNode,
          decoration: InputDecoration(
            isDense: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.lightTheme.colorScheme.primary,
                width: 3.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.lightTheme.colorScheme.primary,
                width: 3.0,
              ),
            ),
            helperText: localizations.tags,
            helperStyle: TextStyle(
              color: AppTheme.lightTheme.colorScheme.secondary,
            ),
            hintText: inputFieldValues.tags.isNotEmpty ? '' : '',
            errorText: inputFieldValues.error,
            prefixIconConstraints: BoxConstraints(maxWidth: _distanceToField * 0.8),
            prefixIcon: inputFieldValues.tags.isNotEmpty
                ? SingleChildScrollView(
                    controller: inputFieldValues.tagScrollController,
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: 8,
                      ),
                      child: Wrap(
                          runSpacing: 4.0,
                          spacing: 4.0,
                          children: inputFieldValues.tags.map((String tag) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                color: AppTheme.lightTheme.colorScheme.onPrimary,
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    child: Text(
                                      '#$tag',
                                      style: TextStyle(color: AppTheme.lightTheme.colorScheme.primary),
                                    ),
                                    onTap: () {
                                      //print("$tag selected");
                                    },
                                  ),
                                  const SizedBox(width: 4.0),
                                  InkWell(
                                    child: Icon(
                                      Icons.cancel,
                                      size: 14.0,
                                      color: AppTheme.lightTheme.colorScheme.primary,
                                    ),
                                    onTap: () {
                                      inputFieldValues.onTagRemoved(tag);
                                    },
                                  )
                                ],
                              ),
                            );
                          }).toList()),
                    ),
                  )
                : null,
          ),
          onChanged: inputFieldValues.onTagChanged,
          onSubmitted: inputFieldValues.onTagSubmitted,
        );
      },
    );
  }

  Widget _htmlEditorField(String content) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: HtmlEditor(
        controller: _contentHtmlController,
        htmlToolbarOptions: HtmlToolbarOptions(
          defaultToolbarButtons: [
            const StyleButtons(),
            const FontSettingButtons(),
            const ColorButtons(),
            const InsertButtons(),
            const ListButtons(),
            const ParagraphButtons(),
            const OtherButtons(),
          ],
          toolbarPosition: ToolbarPosition.belowEditor,
          toolbarType: ToolbarType.nativeScrollable,
          textStyle: TextStyle(
            fontFamily: 'Roboto',
            color: AppTheme.lightTheme.colorScheme.secondary,
          ),
          dropdownBackgroundColor: AppTheme.lightTheme.colorScheme.primary,
          onButtonPressed: (button, controller, focusNode) {
            return true;
          },
        ),
        htmlEditorOptions: HtmlEditorOptions(
          hint: localizations.content,
          initialText: content,
        ),
        otherOptions: OtherOptions(
          decoration: BoxDecoration(
            color: AppTheme.lightTheme.colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      _selectedImageWeb = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (_selectedImageWeb != null) {
        setState(() {});
      }
    } else {
      // En móvil o desktop, puedes usar el ImagePicker
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    }
  }
}
