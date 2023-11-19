import 'package:booklyapp/core/widget/custom_erroe_widget.dart';
import 'package:booklyapp/core/widget/custom_loding%20_widget.dart';
import 'package:booklyapp/feature/home/presentation/manger/featured_books_cubit/newesbooks_cubit/newest_books_cubit.dart';
import 'package:booklyapp/feature/home/presentation/manger/featured_books_cubit/newesbooks_cubit/newest_books_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bast_seller_list_viewItem.dart';

// ignore: camel_case_types
class Best_seller_List_View extends StatelessWidget {
  const Best_seller_List_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewstBooksState>(
        builder: (context, state) {
      if (state is NewsetBooksSuccess) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            });
      } else if (state is NewsetBooksFailure) {
        return Center(child: CustomErrorWidget(errMassage: state.errMessage));
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
