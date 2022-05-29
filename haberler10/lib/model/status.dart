import 'package:cloud_firestore/cloud_firestore.dart';

class Status{
  String id;
  String image;
  String title;
  String content;
  String category;
  String date;

  Status({required this.id, required this.image, required this.title, required this.content, required this.category, required this.date});

  factory Status.fromSnapshot(DocumentSnapshot snapshot){
    return Status(
        id: snapshot.id,
        image: snapshot["image"],
        title: snapshot["title"],
        content: snapshot["content"],
        category: snapshot["category"],
        date: snapshot["date"],
    );
  }
}