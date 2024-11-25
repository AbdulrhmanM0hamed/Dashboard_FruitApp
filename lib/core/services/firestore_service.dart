
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/core/services/database_service.dart';


class FirestoreService implements DatabaseService {
  final db = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data , String? documentId }) async {

        if(documentId != null){
          await db.collection(path).doc(documentId).set(data);
         
        }
        else{ 
          await db.collection(path).add(data);
        }
   
  }
  
  @override
  Future<Map<String , dynamic>> getData({required String path, required String documentId}) async {
   var data =  await db.collection(path).doc(documentId).get()  ;
   return data.data() as Map<String, dynamic  > ;
}

  @override
Future<bool> isUserExist({required String path, required String documentId}) async {
  try {
    var docSnapshot = await db.collection(path).doc(documentId).get();
    return docSnapshot.exists; // يعيد true إذا كان المستند موجودًا، و false إذا لم يكن موجودًا
  } catch (e) {
    log('Error checking if user exists: $e');
    return false;
  }
}
}
