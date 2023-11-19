import 'package:booklyapp/feature/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();
  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoding extends FeaturedBooksState {}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMassage;
  const FeaturedBooksFailure(this.errMassage);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuccess(this.books);
}
