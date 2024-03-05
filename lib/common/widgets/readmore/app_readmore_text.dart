import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AppReadMoreText extends StatelessWidget {
  const AppReadMoreText({
    super.key,
    this.text =
        'A cappuccino is the perfect balance of espresso, steamed milk and foam. This coffee is all about the structure and the even splitting of all elements into equal thirds. An expertly made cappuccino should be rich, but not acidic and have a mildly sweet flavouring from the milk.',
    this.lines = 2,
    this.textAlign = TextAlign.justify,
    this.trimMode = TrimMode.Line,
    this.collapsedText = 'Show More',
    this.expandedText = '..Show less',
    this.moreStyle = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    this.lessStyle = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  });

  final String text, collapsedText, expandedText;
  final int lines;
  final TextAlign textAlign;
  final TrimMode trimMode;
  final TextStyle moreStyle;
  final TextStyle lessStyle;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: lines,
      textAlign: textAlign,
      trimMode: trimMode,
      trimCollapsedText: collapsedText,
      trimExpandedText: expandedText,
      moreStyle: moreStyle,
      lessStyle: lessStyle,
    );
  }
}
