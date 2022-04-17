import 'package:flutter/material.dart';
import 'package:news_app/Models/sources_response.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;

  TabItem.name({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).primaryColor),
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent),
            child: Text(
              source.name ?? 'None',
              style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Theme.of(context).primaryColor),
            )),
      ],
    );
  }
}
