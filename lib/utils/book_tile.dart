// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:uilibrary/utils/book_description.dart';

class BookTile extends StatelessWidget {
  final String bookImagePath;
  final String bookName;
  final String author;
  final String year;
  final String language;
  final String size;
  final String edition;

  BookTile({
    required this.bookImagePath,
    required this.bookName,
    required this.author,
    required this.year,
    required this.language,
    required this.size,
    required this.edition,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 40),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //book Image
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDescription(
                          bookImagePath: bookImagePath,
                          bookName: bookName,
                          author: author,
                          year: year,
                          language: language,
                          size: size,
                          edition: edition),
                    ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(bookImagePath),
              ),
            ),

            //book name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    author,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.language),
                    Text(language),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Year: $year'),
                    Icon(Icons.download),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
