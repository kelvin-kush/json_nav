import 'package:flutter/material.dart';

class Newscard extends StatelessWidget {
  Map<String, dynamic> map;
  Newscard({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Image.network(map['image']),
            Text(
              map['heading'],
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            Text(
              map['story'],
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
