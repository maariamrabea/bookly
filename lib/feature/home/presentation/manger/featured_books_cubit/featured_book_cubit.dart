import 'package:booklyapp/feature/home/data/repos/home_repos.dart';
import 'package:booklyapp/feature/home/presentation/manger/featured_books_cubit/featured_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoding());
    var result = await homeRepo.fetchNewsBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMassage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
