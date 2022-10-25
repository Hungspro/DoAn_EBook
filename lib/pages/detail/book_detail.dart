import 'package:doan_ebook_1/models/book.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text('DetailPage')
        ),
    );
  }
  
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_outlined),
        color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.more_horiz_outlined,
              color: Colors.black,
              )
              )
        ],
    );
  }
}