import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark ? AppColor.darkGrey : AppColor.grey,
              thickness: 1,
              indent: 30,
              endIndent: 10),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
              color: dark ? AppColor.darkGrey : AppColor.grey,
              thickness: 1,
              indent: 10,
              endIndent: 30),
        ),
      ],
    );
  }
}
