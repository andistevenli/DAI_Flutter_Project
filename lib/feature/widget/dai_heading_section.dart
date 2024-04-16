import 'package:dai_sales/utils/constant/unit.dart';
import 'package:flutter/material.dart';

class DAIHeadingSection extends StatefulWidget {
  final bool isHome;
  final List<Widget> children;

  const DAIHeadingSection({
    super.key,
    required this.isHome,
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
      height: 104,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // DAINavigationButton(
          //   forTable: false,
          //   forClose: false,
          //   icon: Icons.arrow_back,
          //   onPressed: () => Navigator.pop(context),
          // ),
          // 64.0.hspace,
          SizedBox(
            width: 500,
            child: Row(
              children: widget.children,
            ),
          ),
          // 64.0.hspace,
          // DAINavigationButton(
          //   forTable: false,
          //   forClose: true,
          //   icon: Icons.close,
          //   onPressed: () => Navigator.pushNamed(
          //     context,
          //     homeRoute,
          //   ),
          // ),
        ],
      ),
    );
  }
}
