import 'package:flutter/material.dart';

import '../Components/category_item.dart';
import '../Models/category.dart';

class F_MainCategories extends StatelessWidget {
  var mainCategories = Category.getMainCategories();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Pick the category that you interest',
              style: Theme.of(context).textTheme.headline2,
            )),
        Expanded(
            child: Container(
          margin: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 0,
                childAspectRatio: 4 / 3.5),
            itemBuilder: (context, index) =>
                CategoryItem(category: mainCategories[index], index: index),
            itemCount: mainCategories.length,
          ),
        ))
      ],
    );
  }
}
