import 'package:booklyapp/core/launchUrl/launchUrl.dart';
import 'package:booklyapp/feature/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            text: 'Free#',
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            backgroundColor: const Color(0xffEF8363),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            text: getText(bookModel),
          ))
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
