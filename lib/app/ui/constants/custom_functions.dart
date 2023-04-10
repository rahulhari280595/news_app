import 'package:flutter/material.dart';
import 'package:news_app/app/ui/widgets/custom_indicator.dart';
import 'package:news_app/app/ui/widgets/empty_notifier_widget.dart';
import 'package:news_app/app/ui/widgets/server_error_widget.dart';
import 'package:news_app/app/utils/loading_state_enum.dart';

class CustomFunctions {

  //handle API calls
  static handleStateWidget(LoadingState state) {
    if (state == LoadingState.loading) {
      return const CustomIndicator();
    } else if (state == LoadingState.failed) {
      return const ServerErrorWidget();
    }else if(state == LoadingState.empty){
      return const EmptyNotifierWidget();
    }
  }
}
