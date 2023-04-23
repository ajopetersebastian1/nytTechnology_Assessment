import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nytimes/base/base_view.dart';
import 'package:nytimes/screens/news_det_screen/controllers/news_det_controllers.dart';

class NewsDetScreen extends BaseView<NewsDetController> {

  
   NewsDetScreen({super.key});

      late InAppWebViewController webview;

    GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(controller.newsArticle.url!),
          ),
          onWebViewCreated: (InAppWebViewController controller){
            webview=controller;
          },
        ),

      ),
    );
  }
}
