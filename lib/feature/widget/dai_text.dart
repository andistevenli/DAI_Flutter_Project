import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:flutter/material.dart';

class DAIText extends StatefulWidget {
  final bool canCopy;
  final String content;
  final TextHierarchy textHierarchy;
  final FontWeight? fontWeight;
  final Color? color;
  final double? width;
  final TextAlign? textAlign;

  const DAIText({
    super.key,
    required this.canCopy,
    required this.content,
    required this.textHierarchy,
    required this.fontWeight,
    required this.color,
    required this.width,
    required this.textAlign,
  });

  @override
  State<DAIText> createState() => _DAITextState();
}

class _DAITextState extends State<DAIText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: widget.canCopy == true
          ? SelectableText(
              widget.content,
              textAlign: widget.textAlign,
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
            )
          : Text(
              widget.content,
              textAlign: widget.textAlign,
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
