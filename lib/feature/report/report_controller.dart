import 'package:dai_sales/utils/enum/finite_state.dart';
import 'package:flutter/material.dart';

class ReportController with ChangeNotifier {
  FiniteState _finiteState = FiniteState.initial;
  FiniteState get finiteState => _finiteState;

  void changeState(FiniteState finiteState) {
    _finiteState = finiteState;
    notifyListeners();
  }
}
