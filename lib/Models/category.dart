import 'package:flutter/material.dart';

class Category {

  String id;
  String title;
  String image_url;
  Color background;

  Category(
      {required this.id, required this.title, required this.image_url, required this.background});

  static List<Category> getMainCategories() {
    return [
      Category(id: 'business',
          title: 'Business',
          image_url: 'assets/bussines.png',
          background: Color(0xffCF7E48)),
      Category(id: 'entertainment',
          title: 'Entertainment',
          image_url: 'assets/environment.png',
          background: Color(0xff003E90)),
      Category(id: 'general',
          title: 'General',
          image_url: 'assets/environment.png',
          background: Color(0xffED1E79)),
      Category(id: 'health',
          title: 'Health',
          image_url: 'assets/health.png',
          background: Color(0xff39A552)),
      Category(id: 'science',
          title: 'Science',
          image_url: 'assets/science.png',
          background: Color(0xffF2D352)),
      Category(id: 'sports',
          title: 'Sports',
          image_url: 'assets/ball.png',
          background: Color(0xffC91C22)),
      Category(id: 'technology',
          title: 'Technology',
          image_url: 'assets/science.png',
          background: Color(0xffF2D352)),
    ];
  }

}
