import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../base/base_sore_state.dart';
import '../../base/base_stl_page.dart';
import '../../config/app_dimensions.dart';
import '../../config/app_formas.dart';
import 'home_store.dart';
import 'widgets/text_input_field.dart';

class HomePage extends BaseStatelessPage {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final store = context.read<HomeStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppDimensions.verticalMargin,
                horizontal: AppDimensions.horizontalMargin,
              ),
              child: Center(
                child: Observer(
                  builder: (_) {
                    if (store.state == BaseStoreState.initial) {
                      return TextInputField(
                        controller: controller,
                        onSubmitted: (value) =>
                            store.getWeatherByCityName(value),
                      );
                    }
                    if (store.state == BaseStoreState.loading) {
                      return const CircularProgressIndicator();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        (store.state == BaseStoreState.error ||
                                store.errorMessage != null)
                            ? Text(store.errorMessage ?? "Error")
                            : Text(
                                "${AppFormats.instance.formatDateTime.format(store.weather!.dateFromTimezone)}\n${store.weather!.name}\n${store.weather!.celsiusTemp.toStringAsFixed(2)}°C",
                                textAlign: TextAlign.center,
                              ),
                        TextInputField(
                          controller: controller,
                          onSubmitted: (value) =>
                              store.getWeatherByCityName(value),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
