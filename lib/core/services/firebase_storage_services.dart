import 'dart:io';
import 'package:dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageServices implements StorageService {
  final storage = Supabase.instance.client.storage;

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    try {
      await storage.from('FruitApp').upload('$path/$fileName', file);
      final downloadUrl =
          storage.from('FruitApp').createSignedUrl('$path/$fileName' , 60 * 60 * 24);
      return downloadUrl;
    } catch (e) {
      print('Error details: $e');
      throw Exception('Failed to upload file: $e');
    }
  }
}
