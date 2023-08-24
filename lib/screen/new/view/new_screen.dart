import 'package:flutter/material.dart';
import 'package:news_api/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  HomeProvider? HomeproviderTrue;
  HomeProvider? HomeproviderFalse;


  @override
  Widget build(BuildContext context) {

    HomeproviderFalse=Provider.of<HomeProvider>(context,listen: false);
    HomeproviderTrue=Provider.of<HomeProvider>(context,listen: true);
    int index=ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("Daily New"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.network(
                  "${HomeproviderTrue!.NewsList!.articleList![index].urlToImage}",
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${HomeproviderTrue!.NewsList!.articleList![index].source!.name}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${HomeproviderTrue!.NewsList!.articleList![index].title}",
                        style: TextStyle(fontSize: 20,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}