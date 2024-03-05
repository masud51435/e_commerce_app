import 'package:flutter/material.dart';

import '../../../../../utils/constants/text_string.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      AppTexts.signupTitle,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
