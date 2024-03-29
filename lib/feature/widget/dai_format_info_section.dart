import 'package:dai_sales/feature/widget/dai_column_chip.dart';
import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/text.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_chip_status.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:dai_sales/utils/extention/white_space.dart';
import 'package:flutter/material.dart';

class FormatInfoSection extends StatefulWidget {
  final int totalChip;
  final String chipContent;
  final FiniteChipStatus finiteChipStatus;

  const FormatInfoSection({
    super.key,
    required this.totalChip,
    required this.chipContent,
    required this.finiteChipStatus,
  });

  @override
  State<FormatInfoSection> createState() => _FormatInfoSectionState();
}

class _FormatInfoSectionState extends State<FormatInfoSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg,
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
              content: uploadFileBodyTop,
              textHierarchy: TextHierarchy.caption,
              fontWeight: FontWeight.normal,
              color: black,
              width: double.infinity,
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
                    content: widget.chipContent,
                    finiteChipStatus: widget.finiteChipStatus,
                  ),
                  separatorBuilder: (context, index) => space16.vspace,
                  itemCount: widget.totalChip,
                ),
              ),
            ),
            20.0.vspace,
            const DAIText(
              content: uploadFileBodyBottom,
              textHierarchy: TextHierarchy.caption,
              fontWeight: FontWeight.normal,
              color: black,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
