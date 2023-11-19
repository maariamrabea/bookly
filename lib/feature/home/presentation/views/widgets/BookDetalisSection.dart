import 'package:booklyapp/feature/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/styles.dart';
import 'Book_reting.dart';
import 'booksAction.dart';
import 'CustomBookImage.dart';

class BookDetalisSection extends StatelessWidget {
  const BookDetalisSection({Key? key, required this.book}) : super(key: key);
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            imageUri: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        Text(
          book.volumeInfo.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          book.volumeInfo.authors?[0] ?? '',
          style: Styles.textStyle18,
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 30,
        ),
        BooksAction(
          bookModel: book,
        ),
      ],
    );
  }
}
