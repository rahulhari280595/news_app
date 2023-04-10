import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/bloc/cubits/news_cubit.dart';
import 'package:news_app/app/ui/constants/custom_functions.dart';
import 'package:news_app/app/ui/widgets/empty_notifier_widget.dart';
import 'package:news_app/app/ui/screens/home/widgets/news_widget.dart';
import 'package:news_app/app/ui/screens/home/widgets/search_bar_widget.dart';
import 'package:news_app/app/ui/theme/app_colors.dart';
import 'package:news_app/app/ui/widgets/custom_indicator.dart';
import 'package:news_app/app/ui/widgets/custom_navigation_bar.dart';
import 'package:news_app/app/utils/loading_state_enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    loadBreakingNews();
    super.initState();
  }

  void loadBreakingNews() {
    context.read<NewsCubit>().getBreakingNews();
  }

  void switchNewsTab() {
    context.read<NewsCubit>().switchNewsState(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text("News App"),
        ),
        bottomNavigationBar: CustomNavigationBar(
          selectedValue: (value) {
            setState(() {
              _selectedIndex = value;
            });
            switchNewsTab();
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded),
              label: "Breaking News",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search News",
            ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            selectedNewsPage(),
            selectedNewsPage(isSearch: _selectedIndex == 1)
          ],
        ));
  }

  Widget selectedNewsPage({bool isSearch = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: isSearch ? 20.0 : 0.0,
      ),
      child: Column(
        children: [
          isSearch ? const SearchBarWidget() : const SizedBox(),
          Expanded(
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                return state.state == LoadingState.completed
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        itemCount: state.news!.articles!.length,
                        itemBuilder: (context, item) {
                          return NewsWidget(
                            newsAuthor:
                                state.news!.articles![item].author! == ""
                                    ? "No Author"
                                    : state.news!.articles![item].author!,
                            newsTime: state.news!.articles![item].publishedAt!,
                            newsTitle: state.news!.articles![item].title!,
                            newsDescription:
                                state.news!.articles![item].description,
                            newsImage: state.news!.articles![item].urlToImage,
                          );
                        },
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                      )
                    : CustomFunctions.handleStateWidget(
                        state.state!,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
