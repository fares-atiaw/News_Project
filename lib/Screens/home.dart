import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Components/drawable_widget.dart';
import '../Fragments/main_categories_fragment.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'main-categories';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/pattern.png'), fit: BoxFit.fill),
        color: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News Categories'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        drawer: Drawer(
          child: MyDrawable(),
        ),
        body: F_MainCategories(),
      ),
    );
  }
}
