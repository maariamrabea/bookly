import 'package:booklyapp/feature/home/data/repos/home_repos.dart';
import 'package:booklyapp/feature/home/presentation/manger/smila_book_cubit/similar_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilardBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(errMessage: failure.errMassage));
    }, (books) {
      emit(SimilarBooksSeccess(books: books));
    });
  }
}
