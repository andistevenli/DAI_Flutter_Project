import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:dai_sales/utils/responsive/size_config.dart';
import 'package:flutter/material.dart';

class DAIBreadcrumbButton extends StatefulWidget {
  final bool current;
  final String content;
  final void Function()? onPressed;

  const DAIBreadcrumbButton({
    super.key,
    required this.current,
    required this.content,
    required this.onPressed,
  });

  @override
  State<DAIBreadcrumbButton> createState() => _DAIBreadcrumbButtonState();
}

class _DAIBreadcrumbButtonState extends State<DAIBreadcrumbButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (widget.current == true) {
              if (states.contains(MaterialState.pressed)) {
                return secondary700;
              } else if (states.contains(MaterialState.hovered)) {
                return secondary300;
              } else if (states.contains(MaterialState.disabled)) {
                return secondart150;
              } else {
                return secondary500;
              }
            } else {
              if (states.contains(MaterialState.pressed)) {
                return secondary300;
              } else if (states.contains(MaterialState.hovered)) {
                return secondart150;
              } else if (states.contains(MaterialState.disabled)) {
                return secondart50;
              } else {
                return secondart50;
              }
            }
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (widget.current == true) {
              if (states.contains(MaterialState.pressed)) {
                return white;
              } else if (states.contains(MaterialState.hovered)) {
                return white;
              } else if (states.contains(MaterialState.disabled)) {
                return white;
              } else {
                return white;
              }
            } else {
              if (states.contains(MaterialState.pressed)) {
                return secondary500;
              } else if (states.contains(MaterialState.hovered)) {
                return secondary500;
              } else if (states.contains(MaterialState.disabled)) {
                return white;
              } else {
                return secondary500;
              }
            }
          },
        ),
        elevation: const MaterialStatePropertyAll(elevation),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(border16),
          ),
        ),
        fixedSize: const MaterialStatePropertyAll<Size>(
          Size(double.nan, breadcrumbButtonHeight),
        ),
      ),
      child: DAIText(
        width: null,
        textAlign: TextAlign.center,
        content: widget.content,
        textHierarchy: TextHierarchy.body,
        fontWeight: FontWeight.bold,
        color: widget.current == true ? white : secondary500,
      ),
    );
  }
}
