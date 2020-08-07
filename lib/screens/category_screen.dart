import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/modal/artical.dart';
import 'package:news_app/screens/home_screen.dart';

class CategoryScreen extends StatefulWidget {

  final String category;
  CategoryScreen({this.category});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<ArticalModal> articals = List<ArticalModal>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass categoryNews = CategoryNewsClass();
    await categoryNews.getNews(widget.category);
    articals = categoryNews.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.category,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.black87),
            ),
          ],
        ),
        actions: <Widget>[
          Opacity(
              opacity: 0,
              child: Icon(
                Icons.add,
                size: 40,
              ) //for alignment appBar title
          ),
        ],
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: ListView.builder(
                          itemCount: articals.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                              blogImage: articals[index].urlToImage,
                              blogTitle: articals[index].title,
                              blogDesc: articals[index].description,
                              url: articals[index].url,
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
