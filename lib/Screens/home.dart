import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Models/category.dart';

import '../Components/drawable_widget.dart';
import '../Fragments/main_categories_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'main-categories';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        body: F_MainCategories(onCategoryClicked),
      ),
    );
  }

  void onCategoryClicked(Category category) {
    print(category.title);
    print('888');
  }

// Category? selectedCategory=null;
//
// void onCategoryClick(Category category){
//   // if someone clicked on Category, it will go to category details view
//   selectedCategory = category;
//   setState(() {});
// }
}
