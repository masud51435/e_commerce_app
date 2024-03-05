import 'package:e_commerce_app/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = AppHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        //selectedColor: isColor ? AppHelperFunctions.getColor(text) : null,
        backgroundColor: isColor ? AppHelperFunctions.getColor(text) : null,
        labelStyle: TextStyle(
          color: selected ? AppColor.white : null,
        ),
        avatar: isColor
            ? AppRoundedContainer(
                height: 50,
                width: 50,
                color: AppHelperFunctions.getColor(text)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
      ),
    );
  }
}
