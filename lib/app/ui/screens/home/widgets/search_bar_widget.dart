import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/bloc/cubits/news_cubit.dart';
import 'package:intl/intl.dart';
import 'package:news_app/app/ui/constants/app_constants.dart';
import 'package:news_app/app/utils/debounce_util.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  final Debounce _debounce = Debounce(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Search News...",
      ),
      onChanged: (value) {
        String searchValue = value.trim();

        if (searchValue.length >= 4) {
          _debounce.run(() {
            searchNews(searchValue);
          });
        }
      },
    );
  }

  void searchNews(String value) {
    String parsedDate = parseDate();
    context.read<NewsCubit>().searchNews(value, parsedDate);
  }

  void loadBreakingNews() {
    context.read<NewsCubit>().getBreakingNews();
  }

  String parseDate() {
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(now.year, now.month);
    final DateFormat formatter = DateFormat(AppConstants.urlFromDateFormat);
    final String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }
}
