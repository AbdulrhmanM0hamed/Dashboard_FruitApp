import 'dart:io';

import 'package:dashboard/core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b ;

class FirebaseStorageServices implements StorageService {
      
      final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(File file , String path) async {
    
     String fileName = b.basename(file.path);
     String extentionName = b.extension(file.path);
    final fileRef = storageRef.child('$path/$fileName.$extentionName');
     
     fileRef.putFile(file);
     return await fileRef.getDownloadURL();
    
  }

} 