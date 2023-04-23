import 'package:get/get.dart';
import 'package:nytimes/screens/news_screen/controllers/news_articles_controllers.dart';

class NewsArticlesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsArticlesController>(() => NewsArticlesController());
  }
}
