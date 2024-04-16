import 'package:dai_sales/util/responsive/size_config.dart';
import 'package:flutter/material.dart';

extension WhiteSpace on double {
  SizedBox get hspace => SizedBox(
        height: getProportionateScreenHeight(this),
      );
  SizedBox get vspace => SizedBox(
        width: getProportionateScreenWidth(this),
      );
}
