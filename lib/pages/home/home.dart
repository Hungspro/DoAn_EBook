import 'package:doan_ebook_1/pages/home/widgets/book_staggered_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabIndex = 0;
  var botIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
      child: _buildAppBar(),
      ),
      body: Column(
        children: [
          // CustomTab(tabIndex, (int index) {
          //   setState(() {
          //     tabIndex = index;
          //   });
          //   pageController.jumpToPage(index);
          // }),
          Expanded(
              child: BookStaggeredGridView(
                  tabIndex,
                  pageController,
                  (int index) => setState(() {
                        tabIndex = index;
                      })))
        ],
      ),
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    final bottoms = [
      Icons.home_outlined,
      Icons.analytics_outlined,
      Icons.bookmark_border_outlined,
      Icons.person_outline,
    ];
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 55,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => GestureDetector(
                onTap: () => setState(() {
                  botIndex = index;
                }),
                child: Container(
                    width: (width - 40) / 4,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: botIndex == index
                      ? const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 3,
                          color: Colors.blueGrey,
                        ),
                        ),
                      )
                      :null,
                      child: Icon(bottoms[index],
                      size: 30,
                      color: botIndex == index ? Colors.black : Colors.grey[500],
                      ),
                    ),
              ),
          separatorBuilder: (_, index) => const SizedBox(width: 10),
          itemCount: bottoms.length),
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
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.black,
        )),
    title: const Text(
      'All Books',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined, color: Colors.black,)),
      PopupMenuButton<int>(
        icon: const Icon(Icons.more_horiz_outlined, color: Colors.black,),
        itemBuilder: (_) => [
          PopupMenuItem(
            child: const Text('Log out'),
            onTap: () => FirebaseAuth.instance.signOut(),
            ),
        ]
        
      ),
    ],
  );

}
