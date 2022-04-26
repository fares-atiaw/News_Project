import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/Components/tab_controller_item.dart';
import 'package:news_app/Models/category.dart';
import 'package:news_app/Models/sources_response.dart';
import 'package:news_app/api_manager.dart';

class F_CategoryDetails extends StatefulWidget {
  static const String routeName = "category_details";
  Category category;

  F_CategoryDetails(this.category);

  @override
  State<F_CategoryDetails> createState() => _F_CategoryDetailsState();
}

class _F_CategoryDetailsState extends State<F_CategoryDetails> {
  late Future<SourcesResponse> data;

  @override
  void initState() {
    super.initState();
    data = API_Manager.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Container(
      padding: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/pattern.png'), fit: BoxFit.fill),
          color: Colors.white),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<SourcesResponse>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text("Something went wrong\n${snapshot.error}"),
                      ElevatedButton(
                        child: Text("Try Again"),
                        onPressed: () {
                          print(snapshot.error);
                          setState(() {});
                        },
                      ),
                    ],
                  );
                } else if (snapshot.data?.status != "ok") {
                  return Column(
                    children: [
                      Text("Error ${snapshot.data?.status}"),
                      Text("Error ${snapshot.data?.code}"),
                      Text("Error ${snapshot.data?.message}"),
                      ElevatedButton(
                        child: Text("Try Again"),
                        onPressed: () {},
                      ),
                    ],
                  );
                }
                // If server have data
                else {
                  var lista = snapshot.data?.sources ?? [];
                  // return ListView.builder(itemBuilder:(context, index) => Text(lista[index].name!),itemCount: lista.length,);
                  return MyTabController(sources: lista);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
