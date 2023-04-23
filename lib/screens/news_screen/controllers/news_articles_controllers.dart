
import 'package:get/get.dart';
import 'package:nytimes/base/base_controller.dart';
import 'package:nytimes/screens/news_screen/models/articles.dart';
import 'package:nytimes/screens/news_screen/services/news_article_api.dart';

class NewsArticlesController extends BaseController {
  var news = <Result>[].obs;
  var newsArticleResponse = Articles().obs;

  @override
  void onReady() {
    _callnewsArticles();
    super.onReady();
  }

  void _callnewsArticles() async {
    var news = await NewsArticle().getNews(30);
    if (news != null) {
      newsArticleResponse(news);
    }

    notifyChildrens();
  }
  
}
