import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ServerErrorWidget extends StatelessWidget {
  const ServerErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.not_interested_rounded,
            size: 60.0,
            color: AppColors.errorColor,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Server Error",
            style: AppTextStyles.headTextBold_18,
          )
        ],
      ),
    );
  }
}
