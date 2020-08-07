import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/modal/artical.dart';
import 'package:news_app/modal/category_modal.dart';
import 'package:news_app/screens/article_screen.dart';
import 'package:news_app/screens/category_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModal> categories = [];
  List<ArticalModal> articals = List<ArticalModal>();
  bool _loading = true;

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articals = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
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
              'NEWS',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.black),
            ),
            Text(
              'APP',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.blue),
            ),
          ],
        ),
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
                  Container(
                    height: 160,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        }),
                  ),
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

class BlogTile extends StatelessWidget {
  final String blogImage, blogTitle, blogDesc, url;

  BlogTile({this.blogImage, this.blogTitle, this.blogDesc, this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleScreen(
                      blogURL: url,
                    )));
      },
      child: Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 15,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(blogImage,fit: BoxFit.cover,)),
          SizedBox(
            height: 15,
          ),
          Text(
            blogTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(blogDesc, style: TextStyle(fontSize: 15, letterSpacing: 1))
        ]),
      ),
    );
  }
}


class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(category: categoryName.toUpperCase(),)));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageUrl,
                  height: 150,
                  width: 200,
                  fit: BoxFit.cover,
                )),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 150,
                width: 200,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Text(
              categoryName,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
