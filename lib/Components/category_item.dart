import 'package:flutter/material.dart';
import 'package:news_app/Models/category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;
  Function onCategoryClicked;

  CategoryItem(
      {required this.category,
      required this.index,
      required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    color: category.background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(index % 2 == 0 ? 24 : 0),
                        bottomRight: Radius.circular(index % 2 == 0 ? 0 : 24))),
                child: Image.asset(category.image_url)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          ],
        ),
        onTap: onCategoryClicked(category));
  }
}
