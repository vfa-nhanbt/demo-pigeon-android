import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/app_dimensions.dart';

class VideoInfoWidget extends StatelessWidget {
  const VideoInfoWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: AppDimensions.widthSpacer),
        Text(
          title,
          style: TextStyle(
            fontSize: AppDimensions.bodyText1,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 0.6.sw,
          child: Text(
            content ?? "",
            style: TextStyle(
              fontSize: AppDimensions.headline6,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(width: AppDimensions.widthSpacer),
      ],
    );
  }
}
