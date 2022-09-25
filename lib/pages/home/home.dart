import 'package:doan_ebook_1/pages/home/widgets/custom_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          CustomTab(tabIndex, (int index) {
            setState(() {
              tabIndex = index;
            });
              pageController.jumpToPage(index);
          })
        ],
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {}, 
      icon: const Icon(Icons.menu_rounded, 
      color: Colors.black ,)
      ),
    title: const Text(
      'All Books',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {}, 
        icon: const Icon(Icons.search_outlined),
        color: Colors.black,)
    ],
  );

}