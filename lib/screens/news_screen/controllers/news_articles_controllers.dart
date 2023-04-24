
import 'package:get/get.dart';
import 'package:nytimes/base/base_controller.dart';
import 'package:nytimes/screens/news_screen/models/articles.dart';
import 'package:nytimes/screens/news_screen/services/news_article_api.dart';

class NewsArticlesController extends BaseController {
  var newsArticleResponse = Articles().obs;

  @override
  void onReady() {
    _callAriclesOneWeekAgo();
    super.onReady();
  }
// Api call for most poppular News articles  week ago
  void _callAriclesOneWeekAgo() async {
    var news = await NewsArticle().getNews(7);
    if (news != null) {
      newsArticleResponse(news);
    }

  }
  
}
