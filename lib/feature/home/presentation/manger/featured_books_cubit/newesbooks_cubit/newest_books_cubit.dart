import 'package:booklyapp/feature/home/data/repos/home_repos.dart';
import 'package:booklyapp/feature/home/presentation/manger/featured_books_cubit/newesbooks_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBooksCubit extends Cubit<NewstBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsBooks();
    result.fold((failure) {
      emit(NewsetBooksFailure(failure.errMassage));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
