import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:flutter/material.dart';

class DAIText extends StatefulWidget {
  final String content;
  final TextHierarchy textHierarchy;
  final FontWeight? fontWeight;
  final Color? color;
  final double? width;

  const DAIText({
    super.key,
    required this.content,
    required this.textHierarchy,
    required this.fontWeight,
    required this.color,
    required this.width,
  });

  @override
  State<DAIText> createState() => _DAITextState();
}

class _DAITextState extends State<DAIText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Text(
        widget.content,
        style: TextStyle(
          fontSize: widget.textHierarchy == TextHierarchy.table
              ? textSizeTable
              : widget.textHierarchy == TextHierarchy.title
                  ? textSizeTitle
                  : widget.textHierarchy == TextHierarchy.body
                      ? textSizeBody
                      : textSizeCaption,
          fontWeight: widget.fontWeight,
          color: widget.color,
        ),
      ),
    );
  }
}
