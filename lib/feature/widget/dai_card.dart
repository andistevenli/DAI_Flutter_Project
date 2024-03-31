import 'package:dai_sales/feature/widget/button/dai_button.dart';
import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:dai_sales/utils/extention/white_space.dart';
import 'package:flutter/material.dart';

class DAICard extends StatefulWidget {
  final String imageAssetPath;
  final String captionContent;
  final String buttonContent;
  final void Function()? onPressed;

  const DAICard({
    super.key,
    required this.imageAssetPath,
    required this.captionContent,
    required this.buttonContent,
    required this.onPressed,
  });

  @override
  State<DAICard> createState() => _DAICardState();
}

class _DAICardState extends State<DAICard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(cardPadding),
      width: cardWidth,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(border40),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(cardPadding),
              width: double.infinity,
              height: cardImageHeight,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(border20),
              ),
              child: Image.asset(
                widget.imageAssetPath,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            20.0.vspace,
            DAIText(
              width: double.infinity,
              textAlign: TextAlign.start,
              content: widget.captionContent,
              textHierarchy: TextHierarchy.caption,
              fontWeight: FontWeight.normal,
              color: primary300,
            ),
            20.0.vspace,
            DAIButton(
              primary: true,
              width: buttonWidth,
              content: widget.buttonContent,
              onPressed: widget.onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
