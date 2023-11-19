import 'package:booklyapp/feature/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewstBooksState extends Equatable {
  const NewstBooksState();
  @override
  List<Object> get props => [];
}

class NewsetBooksInitial extends NewstBooksState {}

class NewsetBooksLoading extends NewstBooksState {}

class NewsetBooksSuccess extends NewstBooksState {
  final List<BookModel> books;

  const NewsetBooksSuccess(this.books);
}

class NewsetBooksFailure extends NewstBooksState {
  final String errMessage;

  const NewsetBooksFailure(this.errMessage);
}
