// ignore: file_names
import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/core/utils/app_service.dart';
import 'package:booklyapp/feature/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/feature/home/data/repos/home_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?q=subject:computer science&Flitering=free_ebooks&Sorting=newest');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromBookModel(item));
      }
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endpoint: 'volumes?q=subject:programming&Flitering=free_ebooks');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromBookModel(item));
      }
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilardBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?q=subject:programming&Flitering=free_ebooks&Sorting=relevance');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromBookModel(item));
      }
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
