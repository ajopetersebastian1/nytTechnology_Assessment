import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nytimes/constants/asset.dart';
import 'package:nytimes/constants/styles.dart';
import 'package:nytimes/helpers/date_time_formaters.dart';
import 'package:nytimes/screens/news_screen/models/articles.dart';
import 'package:nytimes/widgets/text/custom_text_widget.dart';

class ProductWidget extends StatelessWidget {
  final Result articles;
  final Function() viewMore;
  const ProductWidget(
      {super.key, required this.articles, required this.viewMore});

  @override
  Widget build(BuildContext context) => _widgetView();
  _widgetView() => Card(
        elevation: 1,
        child: InkWell(
          onTap: viewMore,
          child: SizedBox(
            height: 125,
            width: Get.width,
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: articles.media!.isEmpty
                          ? Container(
                              color: Colors.grey,
                              child: Image.asset(
                                noImage,
                                color: Colors.white,
                              ),
                            )
                          : Image.network(
                              articles.media![0].mediaMetadata![2].url!,
                              height: 120,
                              fit: BoxFit.fitHeight,
                            ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: articles.title!,
                        textFontWeight: FontWeight.bold,
                        fintsize: 14,
                        textcolor: kFbBlue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            CustomTextWidget(
                              text: "${convertToAgo(articles.publishedDate)}⭐",
                              fintsize: 16,
                              textFontWeight: FontWeight.normal,
                              textcolor: kGray,
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            CustomTextWidget(
                              text:
                                  "Date ${dateFormater(articles.publishedDate)}",
                              fintsize: 16,
                              textcolor: kGray,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomTextWidget(
                          text: "${articles.source}⭐",
                          fintsize: 16,
                          textFontWeight: FontWeight.bold,textcolor: kGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
