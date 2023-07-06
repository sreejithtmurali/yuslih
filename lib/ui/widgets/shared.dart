import 'package:flutter/material.dart';

import '../../app/utils.dart';

Widget backButton({VoidCallback? onPressed, Color? color}) {
  return FloatingActionButton(
    elevation: 5,
    onPressed: onPressed ?? () => navigationService.back(),
    child:Image.asset(
      "assets/images/arrow-back.png",
      color: color,
    ),
    backgroundColor: Color(0xfffafafa),
  );
}
