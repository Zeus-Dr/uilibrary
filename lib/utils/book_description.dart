// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:uilibrary/utils/book_tile.dart';
import 'package:uilibrary/utils/build_progress.dart';

class BookDescription extends StatefulWidget {
  final String bookImagePath;
  final String bookName;
  final String author;
  final String year;
  final String language;
  final String size;
  final String edition;

  const BookDescription({
    super.key,
    required this.bookImagePath,
    required this.bookName,
    required this.author,
    required this.year,
    required this.language,
    required this.size,
    required this.edition,
  });

  @override
  State<BookDescription> createState() => _BookDescriptionState();
}

class _BookDescriptionState extends State<BookDescription> {
  void _done() {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1,
                  backgroundColor: Colors.white,
                  color: Color.fromARGB(255, 53, 251, 4),
                  strokeWidth: 15,
                ),
                Center(
                  child: BuildProgress(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showProgress() {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 4),
            onEnd: () {
              Navigator.pop(context);
              _done();
            },
            builder: (context, value, child) => SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: value,
                backgroundColor: Colors.white,
                color: Color.fromARGB(255, 53, 251, 4),
                strokeWidth: 15,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Download!'),
          content: Text('Are you sure you want to download this book?'),
          actions: [
            TextButton(
              onPressed: _showProgress,
              child: Text('YES'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('NO'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Icon(Icons.share),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 15),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 60, right: 60, top: 20),
                  padding: EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(widget.bookImagePath),
                  ),
                ),
                Text(
                  widget.bookName,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.author,
                  style: TextStyle(color: Colors.grey[500]),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.year),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                      width: 20,
                    ),
                    Text(widget.language),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 2,
                      width: 20,
                    ),
                    Text(widget.size + 'MB'),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _showDialog,
                    child: Text('DOWNLOAD'),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      shape:
                          Border(bottom: BorderSide(color: Colors.deepOrange)),
                      child: TextButton(
                          onPressed: () => print('Hello'),
                          child: Text('ABOUT')),
                    ),
                    VerticalDivider(
                      width: 20,
                    ),
                    Material(
                      shape:
                          Border(bottom: BorderSide(color: Colors.deepOrange)),
                      child: TextButton(
                          onPressed: () => print('Hello'),
                          child: Text('DESCRIPTION')),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Year:       ' + widget.year,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Edition:        ' + widget.edition,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Author:       ' + widget.author,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Language:       ' + widget.language,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'File:       ' + widget.size + 'MB',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Recommended books',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                //book tiles here
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2 + 100,
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
                        ],
                      ),
                    )),
                  ],
                )
              ],
            )
          ],
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
