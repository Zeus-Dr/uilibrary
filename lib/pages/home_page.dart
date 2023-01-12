// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:uilibrary/utils/book_tile.dart';
import 'package:uilibrary/utils/book_type.dart';
import 'package:uilibrary/utils/logo.dart';
import 'package:uilibrary/utils/navigationdrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of book types
  // [book type, isSelected]
  final List bookType = [
    [
      'Most Downloaded',
      true,
    ],
    [
      'Most Recent',
      false,
    ],
    [
      'All Time Greats',
      false,
    ],
    [
      'Eye Ctaching',
      false,
    ],
  ];
  //user tapped on type
  void typeSelector(int index) {
    setState(() {
      //this for loop makes everything false
      for (int i = 0; i < bookType.length; i++) {
        bookType[i][1] = false;
      }
      bookType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawer(),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height + 5,
          child: Column(children: [
            Logo(),
            SizedBox(height: 25),
            //Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your book',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),

            SizedBox(height: 25),

            //horizontal listview of book types
            Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookType.length,
                    itemBuilder: ((context, index) {
                      return BookType(
                        bookType: bookType[index][0],
                        isSelected: bookType[index][1],
                        onTap: () {
                          typeSelector(index);
                        },
                      );
                    }))),

            // horizontal list view of book tiles
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BookTile(
                  bookImagePath: 'lib/images/thegreatgatsby.jpg',
                  bookName: 'The Great Gatsby',
                  author: 'F. Scott Fitzgerald',
                  language: 'English',
                  year: '1990',
                  edition: '1',
                  size: '4.8',
                ),
                BookTile(
                  bookImagePath: 'lib/images/harrypotter.jpg',
                  bookName: 'Harry Potter',
                  author: 'J.K. ROWLING',
                  language: 'English',
                  year: '1996',
                  edition: '1',
                  size: '5.0',
                ),
                BookTile(
                  bookImagePath: 'lib/images/lostboy.jpg',
                  bookName: 'Lost Boy',
                  author: 'Christina Henry',
                  language: 'English',
                  year: '1986',
                  edition: '1',
                  size: '5.2',
                ),
                BookTile(
                  bookImagePath: 'lib/images/nobodyknowsbutyou.jpg',
                  bookName: 'Nobody Knows But You',
                  author: 'ANICA MROSE RISSI',
                  language: 'English',
                  year: '2019',
                  edition: '1',
                  size: '3.76',
                ),
                BookTile(
                  bookImagePath: 'lib/images/ruleofwolves.jpg',
                  bookName: 'Rule of Wolves',
                  author: 'LEIGH BARDUGO',
                  language: 'English',
                  year: '2020',
                  edition: '1',
                  size: '3.0',
                ),
                BookTile(
                  bookImagePath: 'lib/images/thealcazar.jpg',
                  bookName: 'THE ALCAZAR',
                  author: 'AMY EWING',
                  language: 'English',
                  year: '2010',
                  edition: '1',
                  size: '2.98',
                ),
                BookTile(
                  bookImagePath: 'lib/images/TheMagicStolenfromhim.jpg',
                  bookName: 'The Magic Stolen From Him',
                  author: 'SKYLAR A BLEVINS',
                  language: 'English',
                  year: '2018',
                  edition: '1',
                  size: '1.8',
                ),
                BookTile(
                  bookImagePath: 'lib/images/thewanderer.jpg',
                  bookName: 'The Wanderer',
                  author: 'ALAIN-FOURNIER',
                  language: 'English',
                  year: '1970',
                  edition: '1',
                  size: '2.8',
                ),
                BookTile(
                  bookImagePath: 'lib/images/whenwewerestillhuman.jpg',
                  bookName: 'When We Were Still Human',
                  author: 'VAUGH A. FOSTER JR.',
                  language: 'English',
                  year: '2021',
                  edition: '1',
                  size: '2.4',
                ),
              ],
            ))
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.my_library_books),
          label: 'My Books',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ]),
    );
  }
}
