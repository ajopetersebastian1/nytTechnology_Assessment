
import 'package:get/get.dart';
import 'package:nytimes/base/base_controller.dart';
import 'package:nytimes/screens/news_screen/models/articles.dart';
import 'package:nytimes/screens/news_screen/services/news_article_api.dart';

class NewsDetController extends BaseController {
 late Result newsArticle;
  @override
  void onInit() {
    super.onInit();
    _loadArticle();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void _loadArticle() {
    if (Get.arguments != null) {
      var article = Get.arguments["article"];
      newsArticle=article;
    } else {
      newsArticle=Result(url: 'http://www.google.com');
    }
  }

}
