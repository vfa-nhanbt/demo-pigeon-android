import 'package:flutter/material.dart';

import 'app_loading.dart';
import 'page_action.dart';

abstract class BaseStatefulPage extends StatefulWidget implements PageActions {
  const BaseStatefulPage({
    Key? key,
  }) : super(key: key);

  @override
  void showLoading(BuildContext context) {
    AppLoading.show(context);
  }

  @override
  void hideLoading(BuildContext context) {
    AppLoading.hide(context);
  }
}
