import 'package:booklyapp/feature/home/presentation/manger/featured_books_cubit/featured_book_cubit.dart';
import 'package:booklyapp/feature/home/presentation/manger/featured_books_cubit/featured_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_erroe_widget.dart';
import 'CustomBookImage.dart';

// ignore: camel_case_types
class featuredBooksListView extends StatelessWidget {
  const featuredBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, indext) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push('/BookDetailsView', extra: state.books[indext]);
                  },
                  child: CustomBookImage(
                      imageUri: state
                              .books[indext].volumeInfo.imageLinks?.thumbnail ??
                          ''),
                ),
              );
            },
          ),
        );
      } else if (state is FeaturedBooksFailure) {
        return Center(
          child: CustomErrorWidget(
            errMassage: state.errMassage,
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
