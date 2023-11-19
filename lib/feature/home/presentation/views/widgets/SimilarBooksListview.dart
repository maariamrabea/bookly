import 'package:booklyapp/core/widget/custom_erroe_widget.dart';
import 'package:booklyapp/core/widget/custom_loding%20_widget.dart';
import 'package:booklyapp/feature/home/presentation/manger/smila_book_cubit/similar_book_cubit.dart';
import 'package:booklyapp/feature/home/presentation/manger/smila_book_cubit/similar_book_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomBookImage.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksSeccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, indext) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomBookImage(
                    imageUri:
                        state.books[indext].volumeInfo.imageLinks?.thumbnail ??
                            ''),
              );
            },
          ),
        );
      } else if (state is SimilarBooksFailure) {
        return CustomErrorWidget(errMassage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
