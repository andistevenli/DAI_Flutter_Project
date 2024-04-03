import 'dart:typed_data';
import 'package:dai_sales/utils/constant/text.dart';
import 'package:dai_sales/utils/enum/finite_state.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFileController with ChangeNotifier {
  FiniteState _finiteState = FiniteState.initial;
  FiniteState get finiteState => _finiteState;

  List<String> headerColumns = [];

  void changeState(FiniteState finiteState) {
    _finiteState = finiteState;
    notifyListeners();
  }

  Future<void> uploadExcelFile() async {
    headerColumns.isEmpty;
    changeState(FiniteState.loading);
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      withData: true,
    );
    if (result != null) {
      final Uint8List bytes = result.files.single.bytes!;
      final Excel excel = Excel.decodeBytes(bytes);
      final String firstSheet = excel.tables.keys.first;
      final Sheet? table = excel.tables[firstSheet];
      if (table == null) {
        changeState(FiniteState.failed);
      } else {
        final List<Data?> header = table.rows.first;
        for (var element in header) {
          headerColumns.add(element!.value.toString());
        }
        if (columns.length != headerColumns.length) {
          changeState(FiniteState.failed);
        } else {
          for (int i = 0; i < columns.length; i++) {
            if (columns[i] != headerColumns[i]) {
              changeState(FiniteState.failed);
              break;
            } else {
              changeState(FiniteState.loaded);
            }
          }
        }
      }
    } else {
      changeState(FiniteState.failed);
    }
  }
}
