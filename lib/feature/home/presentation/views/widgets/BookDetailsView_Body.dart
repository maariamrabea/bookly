import 'package:booklyapp/feature/home/data/models/book_model/book_model.dart';
import 'package:flutter/cupertino.dart';

import 'BookDetalisSection.dart';
import 'CustomBookDetailsAppBar.dart';
import 'SimilarBooksSection.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key, required this.bookModel})
      : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetalisSection(
                  book: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 35,
                  ),
                ),
                const SimilarBooksSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
