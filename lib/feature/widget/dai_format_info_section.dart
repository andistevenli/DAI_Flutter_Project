import 'package:dai_sales/feature/widget/dai_column_chip.dart';
import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/text.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_chip_status.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:dai_sales/utils/extention/white_space.dart';
import 'package:flutter/material.dart';

class DAIFormatInfoSection extends StatefulWidget {
  final int totalChip;
  final bool forInfo;
  final List<String> chipContent;

  const DAIFormatInfoSection({
    super.key,
    required this.totalChip,
    required this.forInfo,
    required this.chipContent,
  });

  @override
  State<DAIFormatInfoSection> createState() => _FormatInfoSectionState();
}

class _FormatInfoSectionState extends State<DAIFormatInfoSection> {
  FiniteChipStatus check(int index) {
    
    if (widget.forInfo == true) {
      return FiniteChipStatus.info;
    } else {
      if (columns[index] != widget.chipContent[index]) {
      return FiniteChipStatus.notExist;
    } else {
      return FiniteChipStatus.exist;
    }
      // late bool isExist;
      // for (var element in widget.chipContent) {
      //   if (columns[index] == element) {
      //     isExist = true;
      //     break;
      //   } else {
      //     isExist = false;
      //   }
      // }
      // if (isExist == true) {
      //   return FiniteChipStatus.exist;
      // } else {
      //   return FiniteChipStatus.notExist;
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(cardPadding),
      width: formatInfoSectionWidth,
      height: formatInfoSectionHeight,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(border40),
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const DAIText(
              canCopy: false,
              content: uploadFileBodyTop,
              textHierarchy: TextHierarchy.caption,
              fontWeight: FontWeight.normal,
              color: black,
              width: double.infinity,
              textAlign: TextAlign.start,
            ),
            20.0.vspace,
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.all(cardPadding),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(border24),
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) => DAIColumnChip(
                    content: widget.chipContent[index],
                    finiteChipStatus: check(index),
                  ),
                  separatorBuilder: (context, index) => space16.vspace,
                  itemCount: widget.totalChip,
                ),
              ),
            ),
            20.0.vspace,
            const DAIText(
              canCopy: false,
              content: uploadFileBodyBottom,
              textHierarchy: TextHierarchy.caption,
              fontWeight: FontWeight.normal,
              color: black,
              width: double.infinity,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
