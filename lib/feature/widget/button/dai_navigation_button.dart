import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:flutter/material.dart';

class DAINavigationButton extends StatefulWidget {
  final bool forTable;
  final bool forClose;
  final IconData? icon;
  final void Function()? onPressed;

  const DAINavigationButton({
    super.key,
    required this.forTable,
    required this.forClose,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<DAINavigationButton> createState() => _DAINavigationButtonState();
}

class _DAINavigationButtonState extends State<DAINavigationButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (widget.forClose == true) {
              if (states.contains(MaterialState.pressed)) {
                return primary500;
              } else if (states.contains(MaterialState.hovered)) {
                return primary500;
              } else if (states.contains(MaterialState.disabled)) {
                return bgRed;
              } else {
                return red;
              }
            } else {
              if (states.contains(MaterialState.pressed)) {
                return primary500;
              } else if (states.contains(MaterialState.hovered)) {
                return primary500;
              } else if (states.contains(MaterialState.disabled)) {
                return secondart50;
              } else {
                return secondary500;
              }
            }
          },
        ),
        elevation: const MaterialStatePropertyAll(elevation),
        iconColor: const MaterialStatePropertyAll(white),
        shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(border16),
          ),
        ),
      ),
      icon: Icon(
        widget.icon,
        color: white,
        size: widget.forTable == true ? iconSizeForTable : iconSize,
      ),
    );
  }
}
