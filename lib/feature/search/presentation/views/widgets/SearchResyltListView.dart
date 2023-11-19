import 'package:flutter/cupertino.dart';
// ignore: unused_import
import '../../../../home/presentation/views/widgets/bast_seller_list_viewItem.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            // child: BookListViewItem(bookModel: null,),
          );
        });
  }
}
