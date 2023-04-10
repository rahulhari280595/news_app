import 'package:flutter/material.dart';
import 'package:news_app/app/ui/theme/app_colors.dart';
import 'package:news_app/app/ui/theme/app_text_styles.dart';

class EmptyNotifierWidget extends StatelessWidget {
  const EmptyNotifierWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.newspaper_sharp,
            size: 60.0,
            color: AppColors.errorColor,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "No Results Found",
            style: AppTextStyles.headTextBold_18,
          )
        ],
      ),
    );
  }
}
