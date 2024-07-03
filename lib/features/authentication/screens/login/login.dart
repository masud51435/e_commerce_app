import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/login_signup/login-divider.dart';
import '../../../../common/widgets/login_signup/login_social_btn.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.appBarHeight,
          horizontal: AppSizes.defaultSpace,
        ),
        child: Column(
          children: [
            LoginHeader(),
            SizedBox(
              height: AppSizes.spaceBtwSection,
            ),
            //form
            LoginForm(),
            LoginDivider(
              dividerText: AppTexts.orLogInWith,
            ),
            SizedBox(
              height: AppSizes.defaultSpace,
            ),
            LoginSocialButton(),
          ],
        ),
      ),
    );
  }
}
