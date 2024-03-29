import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_snackbar_status.dart';
import 'package:flutter/material.dart';

class DAISnackbar extends StatefulWidget {
  final FiniteSnackbarStatus finiteSnackbarStatus;
  final String content;

  const DAISnackbar({
    super.key,
    required this.finiteSnackbarStatus,
    required this.content,
  });

  @override
  State<DAISnackbar> createState() => _DAISnackbarState();
}

class _DAISnackbarState extends State<DAISnackbar> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      padding: const EdgeInsets.symmetric(
        vertical: snackbarPaddingVertical,
        horizontal: snackbarPaddingHorizontal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(border24),
      ),
      duration: const Duration(seconds: snackbarDuration),
      width: snackbarWidth,
      backgroundColor: widget.finiteSnackbarStatus == FiniteSnackbarStatus.info
          ? blue
          : widget.finiteSnackbarStatus == FiniteSnackbarStatus.success
              ? green
              : widget.finiteSnackbarStatus == FiniteSnackbarStatus.fail
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
              widget.finiteSnackbarStatus == FiniteSnackbarStatus.info
                  ? Icons.info
                  : widget.finiteSnackbarStatus == FiniteSnackbarStatus.success
                      ? Icons.check_circle
                      : widget.finiteSnackbarStatus == FiniteSnackbarStatus.fail
                          ? Icons.sms_failed
                          : Icons.warning,
              color: white,
              size: snackbarIconSize,
            ),
          ],
        ),
      ),
    );
  }
}
