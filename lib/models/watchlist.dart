// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<WatchList> welcomeFromJson(String str) => List<WatchList>.from(json.decode(str).map((x) => WatchList.fromJson(x)));

String welcomeToJson(List<WatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchList {
    WatchList({
        required this.watched,
        required this.rating,
        required this.title,
        required this.release_date,
        required this.review,
    });

    bool watched;
    int rating;
    String title;
    String release_date;
    String review;

    factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
        watched: json["fields"]["watched"],
        rating: json["fields"]["rating"],
        title: json["fields"]["title"],
        release_date: json["fields"]["release_date"],
        review: json["fields"]["review"],
    );

    Map<String, dynamic> toJson() => {
        "watched": watched,
        "rating": rating,
        "title": title,
        "release_date": release_date,
        "review": review,
    };
}
