import 'package:doan_ebook_1/pages/detail/book_detail.dart';
import 'package:flutter/material.dart';
import '../../../models/book.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailPage(book))
      ),
      child: Container(
        height: book.height as double,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(book.imgUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
