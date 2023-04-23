import 'package:get/get.dart';
import 'package:nytimes/screens/news_det_screen/controllers/news_det_controllers.dart';

class NewsDetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsDetController>(() => NewsDetController());
  }
}
