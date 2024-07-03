import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/login_signup/login-divider.dart';
import '../../../../common/widgets/login_signup/login_social_btn.dart';

import 'widgets/signup_form.dart';
import 'widgets/signup_title.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            SignUpTitle(),
            SizedBox(
              height: AppSizes.spaceBtwSection,
            ),
            SignUpForm(),
            LoginDivider(
              dividerText: AppTexts.orSignUpWith,
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
