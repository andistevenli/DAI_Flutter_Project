import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_snackbar_status.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:dai_sales/utils/extention/white_space.dart';
import 'package:flutter/material.dart';

void showDAISnackbar({
  required BuildContext context,
  required FiniteSnackbarStatus finiteSnackbarStatus,
  required String content,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.symmetric(
        vertical: snackbarPaddingVertical,
        horizontal: snackbarPaddingHorizontal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(border24),
      ),
      duration: const Duration(seconds: snackbarDuration),
      backgroundColor: finiteSnackbarStatus == FiniteSnackbarStatus.info
          ? blue
          : finiteSnackbarStatus == FiniteSnackbarStatus.success
              ? green
              : finiteSnackbarStatus == FiniteSnackbarStatus.fail
                  ? red
                  : yellow,
      behavior: SnackBarBehavior.floating,
      content: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              finiteSnackbarStatus == FiniteSnackbarStatus.info
                  ? Icons.info
                  : finiteSnackbarStatus == FiniteSnackbarStatus.success
                      ? Icons.check_circle
                      : finiteSnackbarStatus == FiniteSnackbarStatus.fail
                          ? Icons.sms_failed
                          : Icons.warning,
              color: white,
              size: snackbarIconSize,
            ),
            space12.hspace,
            DAIText(
              canCopy: false,
              content: content,
              textHierarchy: TextHierarchy.caption,
              fontWeight: FontWeight.bold,
              color: white,
              width: null,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
