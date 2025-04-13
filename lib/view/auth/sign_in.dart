import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:javier_website/core/l10n/app_locale.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Text(
                //   'Welcome Back!',
                //   style: Theme.of(context).textTheme.headline4,
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: localizations.email,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: localizations.password,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle email/password sign-in
                  },
                  child: const Text('Sign In'),
                ),
                // const SizedBox(height: 16),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     // Handle Google sign-in
                //   },
                //   icon: const Icon(Icons.g_mobiledata),
                //   label: const Text('Sign in with Google'),
                // ),
                //const SizedBox(height: 16),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     // Handle GitHub sign-in
                //   },
                //   icon: const Icon(Icons.code),
                //   label: const Text('Sign in with GitHub'),
                // ),
                const SizedBox(height: 16),
                if (!isSmallScreen)
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Go Back'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

