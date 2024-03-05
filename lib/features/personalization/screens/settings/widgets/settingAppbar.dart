import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/Custom_appbar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_string.dart';

class SettingAppBar extends StatelessWidget {
  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      //paddingHorizontal: AppSizes.defaultSpace,
      title: Text(
        AppTexts.account,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .apply(color: AppColor.white),
      ),
    );
  }
}
