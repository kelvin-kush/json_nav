import 'package:flutter/material.dart';
import 'package:navigation_drawer/models/news.dart';
import 'package:navigation_drawer/widgets/Newscard.dart';
import 'package:provider/provider.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Top Stories'),
      // ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Center(
          child: Consumer<NewsData>(
            builder: (context, value, child) {
              return value.map.length == 0 && !value.error
                  ? CircularProgressIndicator()
                  : value.error
                      ? Text('Oops something went wrong ${value.errorMessage}')
                      : ListView.builder(
                          itemCount: value.map['stories'].length,
                          itemBuilder: (context, index) {
                            return Newscard(map: value.map['stories'][index]);
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
