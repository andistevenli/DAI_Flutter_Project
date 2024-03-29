import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:dai_sales/utils/responsive/size_config.dart';
import 'package:flutter/material.dart';

class DAIButton extends StatefulWidget {
  final bool primary;
  final double width;
  final String content;
  final void Function()? onPressed;

  const DAIButton({
    super.key,
    required this.primary,
    required this.width,
    required this.content,
    required this.onPressed,
  });

  @override
  State<DAIButton> createState() => _DAIButtonState();
}

class _DAIButtonState extends State<DAIButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (widget.primary == false) {
              if (states.contains(MaterialState.pressed)) {
                return primary50;
              } else if (states.contains(MaterialState.hovered)) {
                return white;
              } else if (states.contains(MaterialState.disabled)) {
                return Colors.transparent;
              }
              return Colors.transparent;
            }
            if (states.contains(MaterialState.pressed)) {
              return primary950;
            } else if (states.contains(MaterialState.hovered)) {
              return primary300;
            } else if (states.contains(MaterialState.disabled)) {
              return primary50;
            }
            return primary500;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (widget.primary == false) {
              if (states.contains(MaterialState.pressed)) {
                return primary500;
              } else if (states.contains(MaterialState.hovered)) {
                return primary500;
              } else if (states.contains(MaterialState.disabled)) {
                return primary50;
              }
              return primary500;
            }
            if (states.contains(MaterialState.pressed)) {
              return white;
            } else if (states.contains(MaterialState.hovered)) {
              return white;
            } else if (states.contains(MaterialState.disabled)) {
              return white;
            }
            return white;
          },
        ),
        elevation: const MaterialStatePropertyAll<double>(elevation),
        fixedSize: MaterialStatePropertyAll<Size>(
          Size(
            widget.width,
            buttonHeight,
          ),
        ),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(border20),
          ),
        ),
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            if (widget.primary == false) {
              if (states.contains(MaterialState.pressed)) {
                return const BorderSide(
                  color: primary500,
                  width: borderWidth,
                );
              } else if (states.contains(MaterialState.hovered)) {
                return const BorderSide(
                  color: primary500,
                  width: borderWidth,
                );
              } else if (states.contains(MaterialState.disabled)) {
                return const BorderSide(
                  color: primary50,
                  width: borderWidth,
                );
              }
              return const BorderSide(
                color: primary500,
                width: borderWidth,
              );
            }
            if (states.contains(MaterialState.pressed)) {
              return BorderSide.none;
            } else if (states.contains(MaterialState.hovered)) {
              return BorderSide.none;
            } else if (states.contains(MaterialState.disabled)) {
              return BorderSide.none;
            }
            return BorderSide.none;
          },
        ),
      ),
      child: DAIText(
        width: null,
        content: widget.content,
        textHierarchy: TextHierarchy.body,
        fontWeight: FontWeight.bold,
        color: widget.primary == true ? white : primary500,
      ),
    );
  }
}
