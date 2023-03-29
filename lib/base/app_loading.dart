import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../uils/dialogs/loading_dialog.dart';

class AppLoading {
  AppLoading._internal();

  bool isLoading = false;

  static void show(BuildContext context) {
    return context.read<AppLoading>().showLoadingDialog(context);
  }

  static void hide(BuildContext context) {
    return context.read<AppLoading>().hideLoadingDialog(context);
  }

  void showLoadingDialog(BuildContext context) {
    if (!isLoading) {
      showDialog(
        context: context,
        builder: (_) => const LoadingDialog(),
        barrierDismissible: false,
      );
      isLoading = true;
    }
  }

  void hideLoadingDialog(BuildContext context) {
    if (isLoading) {
      Navigator.of(context, rootNavigator: true).pop();
      isLoading = false;
    }
  }
}
