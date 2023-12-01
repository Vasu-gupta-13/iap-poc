import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:in_app_purchase_poc/utils/color.dart';
class Validator {
  static String? requiredValidation(String? input) {
    if (isEmptyOrNull(input)) {
      return 'Required*';
    }
    return null;
  }

  static String? validPositiveNumber(String? input) {
    if (isEmptyOrNull(input)) {
      return 'Required*';
    }
    int? parsedInp = int.tryParse(input!);
    if (parsedInp == null) {
      return 'Not a valid number*';
    }
    if (parsedInp.isNegative) {
      return 'Value can\'t be negative*';
    }
    return null;
  }
}
isEmptyOrNull(data) {
  return data == null || data == '';
}

class LoadingIndicator{
  late Flushbar _loadingIndicator;

  void showLoadingIndicator(BuildContext context) {
    _loadingIndicator = Flushbar(
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: c3,
      message: "Signing in...",
      duration: const Duration(seconds: 10),
    )..show(context);
  }

  void hideLoadingIndicator() {
    if (_loadingIndicator.isShowing()) {
      _loadingIndicator.dismiss();
    }
  }
}