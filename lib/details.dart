import 'package:flutter/material.dart';
import './models/watchlist.dart';
import './drawerWidget.dart';

class Detail extends StatelessWidget {
  const Detail({super.key, required this.movie});

  final WatchList movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        drawer: DrawerWidget(),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(movie.title,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      "Release Date: ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("${movie.release_date}",
                        style: TextStyle(
                          fontSize: 20.0,
                        ))
                  ])),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      "Rating: ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("${movie.rating}/5",
                        style: TextStyle(
                          fontSize: 20.0,
                        ))
                  ])),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text(
                      "Status: ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("${movie.watched == true ? "watched" : "not watched"}",
                        style: TextStyle(
                          fontSize: 20.0,
                        ))
                  ])),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Review: ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(movie.review,
                          style: TextStyle(
                            fontSize: 20.0,
                          )))
                ])),
            Expanded(child: Container()),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }))
          ],
        ));
  }
}
