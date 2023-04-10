import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:news_app/app/ui/constants/api_url.dart';
import 'package:news_app/app/utils/loading_state_enum.dart';

part '../state/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsState());

  final Dio _dio = Dio();

  NewsState? _breakingNewsState;

  NewsState? _searchNewsState;

  Future<void> getBreakingNews() async {
    try {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));

      _breakingNewsState = NewsState.parse(LoadingState.loading, {});
      emit(_breakingNewsState!);
      Response response = await _dio.get(AppUrl.getBreakingNewsURL,
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.formUrlEncodedContentType,
          ));

      if (response.statusCode == 200) {
        _breakingNewsState =
            NewsState.parse(LoadingState.completed, response.data);
      } else {
        _breakingNewsState = NewsState.parse(LoadingState.failed, {});
      }
      emit(_breakingNewsState!);
    } on DioError catch (error) {
      _breakingNewsState = NewsState.parse(LoadingState.failed, {});
      emit(_breakingNewsState!);
      rethrow;
    }
  }

  Future<void> searchNews(String searchValue, String date) async {
    try {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));

      _searchNewsState = NewsState.parse(LoadingState.loading, {});
      emit(_searchNewsState!);
      Response response =
          await _dio.get(AppUrl.getSearchNewsURL(searchValue, date),
              options: Options(
                validateStatus: (_) => true,
                contentType: Headers.formUrlEncodedContentType,
              ));

      if (response.statusCode == 200) {
        _searchNewsState =
            NewsState.parse(LoadingState.completed, response.data);
      } else {
        _searchNewsState = NewsState.parse(LoadingState.failed, {});
      }
      emit(_searchNewsState!);
    } on DioError catch (error) {
      _searchNewsState = NewsState.parse(LoadingState.failed, {});
      emit(_searchNewsState!);
      rethrow;
    }
  }

  void switchNewsState(int page) {
    if (page == 0) {
      emit(_breakingNewsState!);
    } else {
      emit(_searchNewsState!);
    }
  }
}
