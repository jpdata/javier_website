import 'package:flutter/material.dart';
import 'package:javier_website/view/home/widgets/background_widget.dart';
import 'package:javier_website/view/widgets/main_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _scaffoldItem();
  }

  // Widget _backgroundColumnItem(String itemPartName) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       image: DecorationImage(
  //         image: SvgPicture.asset('assets/images/$itemPartName.svg'),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //     child: _scaffoldItem(),
  //   );
  // }

  Widget _stackedItems() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.blue),
        ),
        Positioned.fill(
          child: Row(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  'assets/images/bg-lp.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  'assets/images/bg-mp.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  'assets/images/bg-rp.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        //_scaffoldItem(),
      ],
    );
  }

  Scaffold _scaffoldItem() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/logo-2.png',
          width: 180,
        ),
      ),
      drawer: const MainDrawer(),
      body: const BackgroundWidget(child: Text('Hello')),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Center _scaffoldBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
