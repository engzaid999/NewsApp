import 'dart:convert';
import 'package:news_app/modal/artical.dart';
import 'package:http/http.dart' as http;

class News {

  List<ArticalModal> news = []; // List is empty

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0a096cbf478141a3abd046478e54114a';
    var request = await http.get(url);
    var jsonData = jsonDecode(request.body);

    //condition
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){


          ArticalModal objectArticle = ArticalModal(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt'],
            content: element['content']
          );
          news.add(objectArticle);
        }
      });

    }
  }
}

class CategoryNewsClass {

  List<ArticalModal> news = []; // List is empty

  Future<void> getNews(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&category=$category&business&apiKey=0a096cbf478141a3abd046478e54114a';

    var request = await http.get(url);
    var jsonData = jsonDecode(request.body);

    //condition
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){


          ArticalModal objectArticle = ArticalModal(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              content: element['content']
          );
          news.add(objectArticle);
        }
      });

    }
  }
}
