import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/text.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:dai_sales/utils/extention/white_space.dart';
import 'package:flutter/material.dart';

class DAINoteChip extends StatefulWidget {
  final bool forExistNote;

  const DAINoteChip({
    super.key,
    required this.forExistNote,
  });

  @override
  State<DAINoteChip> createState() => _DAINoteChipState();
}

class _DAINoteChipState extends State<DAINoteChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: chipPaddingVertical,
        horizontal: chipPaddingHorizontal,
      ),
      decoration: BoxDecoration(
        color: widget.forExistNote == true ? bgGreen : bgRed,
        borderRadius: BorderRadius.circular(border24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            widget.forExistNote == true ? Icons.check_circle : Icons.dangerous,
            size: iconSize,
            color: widget.forExistNote == true ? green : red,
          ),
          16.0.hspace,
          DAIText(
            content: uploadFileMessageExist,
            textHierarchy: TextHierarchy.caption,
            fontWeight: FontWeight.normal,
            color: widget.forExistNote == true ? green : red,
            width: null,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
