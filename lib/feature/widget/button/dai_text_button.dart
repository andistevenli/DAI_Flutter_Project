import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:flutter/material.dart';

class DAITextButton extends StatefulWidget {
  final String content;
  final double width;
  final TextAlign? textAlign;
  final void Function()? onPressed;

  const DAITextButton({
    super.key,
    required this.content,
    required this.width,
    required this.textAlign,
    required this.onPressed,
  });

  @override
  State<DAITextButton> createState() => _DAITextButtonState();
}

class _DAITextButtonState extends State<DAITextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return const TextStyle(
                decoration: TextDecoration.none,
                color: blue,
                backgroundColor: Colors.transparent,
              );
            } else if (states.contains(MaterialState.hovered)) {
              return const TextStyle(
                decoration: TextDecoration.underline,
                color: blue,
                backgroundColor: bgBlue,
              );
            } else if (states.contains(MaterialState.disabled)) {
              return const TextStyle(
                decoration: TextDecoration.none,
                color: grey,
                backgroundColor: Colors.transparent,
              );
            } else {
              return const TextStyle(
                decoration: TextDecoration.underline,
                color: blue,
                backgroundColor: Colors.transparent,
              );
            }
          },
        ),
        elevation: const MaterialStatePropertyAll(elevation),
        // fixedSize: const MaterialStatePropertyAll(
        //   Size(
        //     buttonWidth,
        //     buttonHeight,
        //   ),
        // ),
      ),
      child: DAIText(
        canCopy: false,
        width: widget.width,
        textAlign: widget.textAlign,
        content: widget.content,
        textHierarchy: TextHierarchy.body,
        fontWeight: FontWeight.bold,
        color: blue,
      ),
    );
  }
}
