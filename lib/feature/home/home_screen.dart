import 'package:dai_sales/feature/widget/dai_card.dart';
import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/path.dart';
import 'package:dai_sales/utils/constant/route.dart';
import 'package:dai_sales/utils/constant/text.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:dai_sales/utils/extention/white_space.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const DAIText(
          canCopy: false,
          content: home,
          textHierarchy: TextHierarchy.body,
          fontWeight: FontWeight.bold,
          color: black,
          width: null,
          textAlign: null,
        ),
        centerTitle: true,
        backgroundColor: secondary300,
        actions: <Widget>[
          IconButton(
            visualDensity: const VisualDensity(
              horizontal: 2.0,
              vertical: 2.0,
            ),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, homeRoute, (route) => false),
            icon: const Icon(Icons.home),
            tooltip: toolTipHome,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: screenPaddingLeft,
          right: screenPaddingRight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            screenPaddingTop.vspace,
            const DAIText(
              canCopy: false,
              content: homeTitle,
              textHierarchy: TextHierarchy.title,
              fontWeight: FontWeight.bold,
              color: primary500,
              width: double.infinity,
              textAlign: TextAlign.center,
            ),
            space12.vspace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DAICard(
                  imageAssetPath: targetImagePath,
                  captionContent: homeCaptionTarget,
                  buttonContent: homeButtonTarget,
                  onPressed: () {},
                ),
                DAICard(
                  imageAssetPath: reportImagePath,
                  captionContent: homeCaptionReport,
                  buttonContent: homeButtonReport,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    uploadFileRoute,
                  ),
                ),
              ],
            ),
            screenPaddingBottom.vspace,
          ],
        ),
      ),
    );
  }
}
