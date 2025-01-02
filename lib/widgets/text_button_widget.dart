

import 'package:car_rental_vivek_2112/utils/color_constants.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key, required this.buttonTitle, required this.onPressed});
  final String buttonTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: const TextStyle(
              fontWeight: FontWeight.w700, color: ColorConstants.primaryColor),
        ));
  }
}