import 'dart:io';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

class Storage{
  UploadTask? uploadTask;
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  Future<void> uploadFile(
      String filePath,
      String fileName
      )async{
    File file = File(filePath);
    try{
      // await storage.ref('image/$fileName').putFile(file);
      final path = 'image/${fileName}';
      final file = File(filePath);
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(file);
      final snapshot = await uploadTask!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      print(urlDownload);
    }on firebase_core.FirebaseException catch (e){
      print(e);
    }
  }
}