import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Models/category.dart';

import '../Components/drawable_widget.dart';
import '../Fragments/category_details_fragment.dart';
import '../Fragments/main_categories_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'main-categories';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;

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
          child: MyDrawable(onButtonClicked: onDrawableSelected),
          // child: MyDrawable(onButtonClicked:(t){onDrawableSelected(t);}),    //إحتياطي
        ),
        body: selectedCategory == null // switch the fragment if you want
            ? F_MainCategories(onCategoryClicked)
            : F_CategoryDetails(selectedCategory!),
      ),
    );
  }

  void onCategoryClicked(Category category) {
    print(category.title);
    selectedCategory = category;
    setState(() {});
  }

  void onDrawableSelected(String t) {
    if (t == MyDrawable.btn_category && selectedCategory == null) {
      print('You already in categories screen');
    } else if (t == MyDrawable.btn_category) {
      selectedCategory = null;
      setState(() {
        Navigator.pop(context);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    imageCache!.clear();
    imageCache!.clearLiveImages();
  }
}