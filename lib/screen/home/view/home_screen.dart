import 'package:flutter/material.dart';
import 'package:news_api/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  HomeProvider? HomeproviderTrue;
  HomeProvider? HomeproviderFalse;


  Future<void> data() async {
    await Provider.of<HomeProvider>(context, listen: false).callApi();
  }

  @override
  void initState() {
    data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeproviderTrue = Provider.of<HomeProvider>(context, listen: true);
    HomeproviderFalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Daily New"),
            centerTitle: true,
            backgroundColor: Colors.black54
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HomeproviderTrue!.NewsList != null
              ? ListView.builder(
              itemCount: HomeproviderFalse!.NewsList!.articleList!.length,
              itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'news', arguments: index);
                },
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2,color: Colors.black54)
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            "${HomeproviderTrue!.NewsList!.articleList![index].urlToImage}",
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "${HomeproviderTrue!.NewsList!.articleList![index].author}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "${HomeproviderTrue!.NewsList!.articleList![index].title}",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),

                ),
              );
            },
          )
              : Container(),
        ),
      ),
    );
  }
}
