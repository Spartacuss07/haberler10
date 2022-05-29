import 'dart:io';
import 'package:haberler10/service/storage_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/status.dart';
class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StorageService _storageService = StorageService();
  String mediaUrl = "";

  //status eklemek için
    Future<Status> addStatus(String title, String content, String category, String date, XFile pickedFile) async{
    var ref = _firestore.collection("Status");

      mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));

    var documentRef = await ref.add({
      'title': title,
      'content': content,
      'category': category,
      'date': date,
      'image': mediaUrl,
    });

    return Status(id: documentRef.id,  title: title, content: content, category: category, date: date, image: mediaUrl);
  }

  //veri gösterme fonksiyonu
  Stream<QuerySnapshot> getStatus(){
    var ref = _firestore.collection("Status").snapshots();

    return ref;
  }
}