import 'package:flutter/material.dart';
import 'package:nytimes/constants/styles.dart';

class ActionIconWidget extends StatelessWidget {
  final IconData icondata;
  const ActionIconWidget({super.key, required this.icondata});

  @override
  Widget build(BuildContext context) => _widgetView();

  _widgetView() => Icon(
        icondata,
        color: kWhite,
        size: 28,
      );
}
