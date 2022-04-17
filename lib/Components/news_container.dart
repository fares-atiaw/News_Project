// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:news_app/Models/news_response.dart';
import 'package:news_app/Models/sources_response.dart';
import 'package:news_app/api_manager.dart';

class News_Container extends StatefulWidget {
  Source selectedSource;

  News_Container(this.selectedSource);

  @override
  State<News_Container> createState() => _News_ContainerState();
}

class _News_ContainerState extends State<News_Container> {
  late Future<NewsResponse> news;

  @override
  void initState() {
    super.initState();
    news = API_Manager.getNews(widget.selectedSource.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text(widget.selectedSources.name ?? "ffffff"),
        FutureBuilder<NewsResponse>(
            future: news,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return LinearProgressIndicator();
                default:
                  if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text('Error: ${snapshot.error}'),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                news = API_Manager.getNews(
                                    widget.selectedSource.id ?? "");
                              });
                            },
                            child: Text("Try Again"))
                      ],
                    );
                  } else {
                    // (snapshot.hasData)
                    if (snapshot.data?.status != "ok") {
                      // If server comes with null data
                      return Column(
                        children: [
                          Text("Error ${snapshot.data?.status}"),
                          Text("Error ${snapshot.data?.code}"),
                          Text("Error ${snapshot.data?.message}"),
                          ElevatedButton(
                            child: Text("Try Again"),
                            onPressed: () {
                              setState(() {
                                news = API_Manager.getNews(
                                    widget.selectedSource.id ?? "");
                              });
                            },
                          ),
                        ],
                      );
                    } else {
                      // Else server comes with data
                      var data = snapshot.data?.articles ?? [];
                      return Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            print(widget.selectedSource.id);
                            //print(index);
                            return Text(data[index].title ?? "");
                          },
                        ),
                      );
                    }
                  }
              }
            })
      ],
    );
  }
}
