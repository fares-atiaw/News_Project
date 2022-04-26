import 'package:flutter/material.dart';
import 'package:news_app/Models/news_response.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    // print('title => ${news.title} \n author => ${news.author}');
    //print('author => ${news.author}');
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /*CachedNetworkImage(
            imageUrl: news.urlToImage,
            progressIndicatorBuilder: (context, url, progress) => Center(
                child: LinearProgressIndicator(value: progress.progress,)),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                ),
              ),
            ),
            //placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Image.asset("assets/images/empty_data.webp", fit: BoxFit.fitWidth),
          ),*/
          Container(
              height: 220,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: FadeInImage(
                image: NetworkImage(news.urlToImage),
                placeholder: AssetImage('assets/images/error.png'),
                imageErrorBuilder: (context, error, stackTrace) => Image.asset(
                    "assets/images/empty_data.webp",
                    fit: BoxFit.fitWidth),
                fit: BoxFit.fill,
              )
              // news.urlToImage == null
              //     ? Icon(Icons.broken_image)
              //     : Image.network(
              //   news.urlToImage ?? "",
              //   height: 220,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              ),
          SizedBox(height: 5),
          Visibility(
            visible: news.author != null,
            child: Text(news.author ?? "",
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.start),
          ),
          Visibility(
            visible: news.title != null,
            child: Text(news.title ?? "",
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.start),
          ),
          Visibility(
            visible: news.publishedAt != null,
            child: Text(
              news.publishedAt ?? "",
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
