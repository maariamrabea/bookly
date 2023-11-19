import 'package:booklyapp/feature/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();
  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailure({required this.errMessage});
}

class SimilarBooksSeccess extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSeccess({required this.books});
}
