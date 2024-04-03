import 'package:dai_sales/feature/upload-file/upload_file_controller.dart';
import 'package:dai_sales/feature/widget/button/dai_button.dart';
import 'package:dai_sales/feature/widget/button/dai_text_button.dart';
import 'package:dai_sales/feature/widget/dai_format_info_section.dart';
import 'package:dai_sales/feature/widget/dai_snackbar.dart';
import 'package:dai_sales/feature/widget/dai_text.dart';
import 'package:dai_sales/utils/constant/color.dart';
import 'package:dai_sales/utils/constant/route.dart';
import 'package:dai_sales/utils/constant/text.dart';
import 'package:dai_sales/utils/constant/unit.dart';
import 'package:dai_sales/utils/enum/finite_snackbar_status.dart';
import 'package:dai_sales/utils/enum/finite_state.dart';
import 'package:dai_sales/utils/enum/finite_text_hierarchy.dart';
import 'package:dai_sales/utils/extention/white_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  late UploadFileController uploadFileController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      uploadFileController =
          Provider.of<UploadFileController>(context, listen: false);
      uploadFileController.changeState(FiniteState.initial);
      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: screenPaddingLeft,
          right: screenPaddingRight,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              screenPaddingTop.vspace,
              DAIFormatInfoSection(
                forInfo: true,
                totalChip: columns.length,
                chipContent: columns,
              ),
              space24.vspace,
              Consumer<UploadFileController>(
                builder: (context, value, child) {
                  if (value.finiteState == FiniteState.loading) {
                    return LoadingAnimationWidget.staggeredDotsWave(
                      color: primary500,
                      size: 60,
                    );
                  } else if (value.finiteState == FiniteState.failed) {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      showDAISnackbar(
                        context: context,
                        finiteSnackbarStatus: FiniteSnackbarStatus.fail,
                        content: uploadFileMessageError,
                      );
                      value.changeState(FiniteState.initial);
                    });
                  } else if (value.finiteState == FiniteState.loaded) {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      showDAISnackbar(
                        context: context,
                        finiteSnackbarStatus: FiniteSnackbarStatus.success,
                        content: "Your Excel file is uploaded successfully",
                      );
                      Navigator.pushNamed(
                        context,
                        reportRoute,
                      );
                    });
                  } else {
                    return DAIButton(
                      primary: true,
                      width: 500,
                      content: uploadFileButtonUpload,
                      onPressed: () => value.uploadExcelFile(),
                    );
                  }
                  return const SizedBox();
                },
              ),
              space12.vspace,
              Consumer<UploadFileController>(
                builder: (context, value, child) {
                  if (value.finiteState == FiniteState.loading ||
                      value.finiteState == FiniteState.loaded) {
                    return const SizedBox();
                  } else {
                    return DAITextButton(
                      content: uploadFileButtonGuidance,
                      width: buttonWidth,
                      textAlign: TextAlign.center,
                      onPressed: () => showDAISnackbar(
                        context: context,
                        finiteSnackbarStatus: FiniteSnackbarStatus.info,
                        content:
                            "Maaf, fitur ini masih dalam tahap pengembangan",
                      ),
                    );
                  }
                },
              ),
              screenPaddingBottom.vspace,
            ],
          ),
        ),
      ),
    );
  }
}
