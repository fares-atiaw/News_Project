// import 'dart:html';

import 'package:flutter/material.dart';

class MyDrawable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.13,
              //padding: EdgeInsets.symmetric(vertical: 55, horizontal: 40),
              color: Theme.of(context).primaryColor,
              child: Text(
                'News App !',
                style: Theme.of(context).textTheme.headline1,
              )),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(
                    width: 6,
                  ),
                  Text('Categories',
                      style: Theme.of(context).textTheme.headline2)
                ],
              ),
            ),
            //onTap: Navigator,
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 6,
                  ),
                  Text('Settings', style: Theme.of(context).textTheme.headline2)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
