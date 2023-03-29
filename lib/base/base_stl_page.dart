import 'package:flutter/material.dart';

import 'app_loading.dart';
import 'page_action.dart';

abstract class BaseStatelessPage extends StatelessWidget
    implements PageActions {
  const BaseStatelessPage({
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
