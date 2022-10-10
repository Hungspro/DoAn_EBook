import 'package:flutter/material.dart';
import '../../../models/book.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'book_item.dart';

class BookStaggeredGridView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final Function callback;
  BookStaggeredGridView(this.selected, this.pageController, this.callback, {super.key});
  final bookList = Book.generateBooks();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: [
          AlignedGridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: bookList.length,
            itemBuilder: (_, index) => BookItem(bookList[index]) ,
            ),
          Container(),
        ],
      ),
    );
  }
}