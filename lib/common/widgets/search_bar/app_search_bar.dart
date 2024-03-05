import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    this.hintStyle = const TextStyle(color: AppColor.darkGrey),
    required this.onChanged,
    required this.iconChanged,
    this.showColor = false,
  });

  final TextEditingController controller;
  final String hintText;
  final TextStyle hintStyle;
  final void Function(String) onChanged;
  final VoidCallback iconChanged;
  final bool showColor;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: TextFormField(
        style: TextStyle(
          color: widget.showColor
              ? dark
                  ? AppColor.light
                  : AppColor.dark
              : Colors.black,
        ),
        controller: widget.controller,
        keyboardType: TextInputType.multiline,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(AppSizes.cardRadiusLg),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          filled: true,
          fillColor: widget.showColor
              ? dark
                  ? AppColor.dark
                  : AppColor.white
              : Colors.white,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
                  onPressed: widget.iconChanged,
                  icon: const Icon(Icons.clear),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
