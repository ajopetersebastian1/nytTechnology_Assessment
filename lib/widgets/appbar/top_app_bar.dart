
import 'package:flutter/material.dart';
import 'package:nytimes/constants/static_text.dart';
import 'package:nytimes/constants/styles.dart';

import '../icon/action_icons.dart';

AppBar topAppbar({String title = nytimesMostPoppularArticles, bool showAction = true}) => AppBar(
      elevation: 4,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: kWhite,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: kFbBlue,
      leading:               const ActionIconWidget(
                icondata: Icons.menu,
              ),
      actions: showAction
          ? [
              const ActionIconWidget(
                icondata: Icons.search,
              ),
              const SizedBox(
                width: 10,
              ),
            ]
          : [],
    );
