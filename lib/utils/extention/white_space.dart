import 'package:flutter/material.dart';

extension WhiteSpace on double {
  SizedBox get vspace => SizedBox(
        height: this,
      );
  SizedBox get hspace => SizedBox(
        width: this,
      );
}
