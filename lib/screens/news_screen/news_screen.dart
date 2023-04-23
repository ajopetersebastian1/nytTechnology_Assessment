import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nytimes/base/base_view.dart';
import 'package:nytimes/constants/static_text.dart';
import 'package:nytimes/helpers/route.dart';
import 'package:nytimes/screens/news_det_screen/news_det_screen.dart';
import 'package:nytimes/screens/news_screen/controllers/news_articles_controllers.dart';
import 'package:nytimes/screens/news_screen/widget/product_widget.dart';
import 'package:nytimes/widgets/appbar/top_app_bar.dart';

class NewsScreen extends BaseView<NewsArticlesController> {
    //final NewsArticlesController productController = Get.put(NewsArticlesController());
   const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) => _widgetView();

  _widgetView() => Scaffold(
        appBar: topAppbar(title: nytimesMostPoppularArticles, showAction: true),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Obx(() {
            return Column(
              children: [
                const SizedBox(height: 15,),
                if (controller.newsArticleResponse.value.results!= null &&
                    controller.newsArticleResponse.value.results!.isNotEmpty)
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                        child: _productScreen(),
                      ),
                      const Divider(
                        height: 10,
                        thickness: 3,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: CustomTextWidget(
                      //       text:
                      //           'Showing ${productController.news.length}/${productController.newsArticleResponse.value.results!.length}',
                      //       fintsize: 20),
                      // ),
                    ],
                  )),
              ],
            );
          }),
        ),
      );
  _productScreen() {
    var articles = controller.newsArticleResponse.value.results!;

    return ListView.builder(
      itemBuilder: (context, index) {
        var article = articles[index];
        return ProductWidget(
          articles: article,
          viewMore: () {
            Get.toNamed(newsDetScreen,arguments:{"article":article});
          },
        );
      },
      itemCount: articles.length,
    );
  }
}