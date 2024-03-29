import 'package:dai_sales/feature/widget/button/dai_navigation_button.dart';
import 'package:dai_sales/utils/constant/route.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/extention/white_space.dart';
import 'package:flutter/material.dart';

class DAIHeadingSection extends StatefulWidget {
  final List<Widget> children;

  const DAIHeadingSection({
    super.key,
    required this.children,
  });

  @override
  State<DAIHeadingSection> createState() => _DAIHeadingSectionState();
}

class _DAIHeadingSectionState extends State<DAIHeadingSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(headingPadding),
      width: double.infinity,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DAINavigationButton(
              forTable: false,
              forClose: false,
              icon: Icons.arrow_back,
              onPressed: () => Navigator.pop(context),
            ),
            64.0.hspace,
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: widget.children,
                ),
              ),
            ),
            64.0.hspace,
            DAINavigationButton(
              forTable: false,
              forClose: true,
              icon: Icons.close,
              onPressed: () => Navigator.pushNamed(
                context,
                homeRoute,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
