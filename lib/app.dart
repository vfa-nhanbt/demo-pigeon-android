import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/app_dimensions.dart';
import 'config/app_routers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppDimensions.designSize,
      builder: (context, child) => GestureDetector(
        onTap: () {
          // Unfocus when tap out side
          FocusScopeNode currentNode = FocusScope.of(context);
          if (!currentNode.hasPrimaryFocus) {
            currentNode.unfocus();
            currentNode.requestFocus(FocusNode());
          }
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: AppRouters.instance.router.routerDelegate,
          routeInformationParser:
              AppRouters.instance.router.routeInformationParser,
          routeInformationProvider:
              AppRouters.instance.router.routeInformationProvider,
        ),
      ),
    );
  }
}
