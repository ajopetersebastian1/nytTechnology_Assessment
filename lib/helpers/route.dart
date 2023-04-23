import 'package:get/get.dart';
import 'package:nytimes/screens/news_det_screen/binding/news_det_binding.dart';
import 'package:nytimes/screens/news_det_screen/news_det_screen.dart';
import 'package:nytimes/screens/news_screen/binding/news_binding.dart';
import 'package:nytimes/screens/news_screen/news_screen.dart';

const newsScreen = '/news-screen';
const newsDetScreen = '/news-det-screen';
final routes = [
  GetPage(
    name: newsScreen,
    page: () => const NewsScreen(),
    binding: NewsArticlesBinding(),
  ),
    GetPage(
    name: newsDetScreen,
    page: () =>  NewsDetScreen( ),
    binding: NewsDetBinding(),
  ),
];
