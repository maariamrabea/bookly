import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/feature/home/presentation/views/widgets/best_seler_List_View.dart';
import 'package:booklyapp/feature/home/presentation/views/widgets/custanfeaturedbookslistview.dart';
import 'package:booklyapp/feature/home/presentation/views/widgets/custantsppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Custantappbar(),
              ),
              featuredBooksListView(),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //
            ],
          ),
        ),
        SliverFillRemaining(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Best_seller_List_View(),
        ))
      ],
    );
  }
}
