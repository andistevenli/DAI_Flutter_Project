import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_chip_status.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:dai_sales/utils/extention/white_space.dart';
import 'package:flutter/material.dart';

class DAIColumnChip extends StatefulWidget {
  final String content;
  final FiniteChipStatus finiteChipStatus;

  const DAIColumnChip({
    super.key,
    required this.content,
    required this.finiteChipStatus,
  });

  @override
  State<DAIColumnChip> createState() => _DAIChipState();
}

class _DAIChipState extends State<DAIColumnChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: chipPaddingVertical,
        horizontal: chipPaddingHorizontal,
      ),
      decoration: BoxDecoration(
        color: widget.finiteChipStatus == FiniteChipStatus.info
            ? bgBlue
            : widget.finiteChipStatus == FiniteChipStatus.exist
                ? bgGreen
                : bgRed,
        borderRadius: BorderRadius.circular(border16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DAIText(
            content: widget.content,
            textHierarchy: TextHierarchy.caption,
            fontWeight: FontWeight.normal,
            color: widget.finiteChipStatus == FiniteChipStatus.info
                ? blue
                : widget.finiteChipStatus == FiniteChipStatus.exist
                    ? green
                    : red,
            width: null,
            textAlign: TextAlign.center,
          ),
          widget.finiteChipStatus == FiniteChipStatus.info
              ? 0.0.hspace
              : space16.hspace,
          widget.finiteChipStatus == FiniteChipStatus.info
              ? const SizedBox()
              : Icon(
                  widget.finiteChipStatus == FiniteChipStatus.exist
                      ? Icons.check_circle
                      : Icons.dangerous,
                  size: iconSize,
                  color: widget.finiteChipStatus == FiniteChipStatus.exist
                      ? green
                      : red,
                ),
        ],
      ),
    );
  }
}
