import 'package:flutter/material.dart';
import 'package:news_app/Components/news_container.dart';
import 'package:news_app/Components/single_tab_item.dart';
import 'package:news_app/Models/sources_response.dart';

class MyTabController extends StatefulWidget {
  List<Source> sources;

  MyTabController({required this.sources});

  @override
  State<MyTabController> createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController> {
  late int selected = 0;

  @override
  Widget build(BuildContext context) {
    //print(widget.sources[1].name); @ has data
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selected = index;
                print('Tap ${selected} selected');
                setState(() {});
              },
              tabs: widget.sources
                  .map((e) => TabItem.name(
                      source: e,
                      isSelected: selected == widget.sources.indexOf(e)))
                  .toList(),
            ),
            Expanded(
                child: News_Container(
                    widget.sources[selected] //Why here expanded ???
                    )),
          ],
        ));
  }
}
