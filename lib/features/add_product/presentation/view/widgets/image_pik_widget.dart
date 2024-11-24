import 'dart:io'; // لإضافة دعم File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickWidget extends StatefulWidget {
  const ImagePickWidget({super.key, required this.onFileChanged});
    final ValueChanged<File?> onFileChanged;

  @override
  State<ImagePickWidget> createState() => _ImagePickWidgetState();
}

class _ImagePickWidgetState extends State<ImagePickWidget> {

  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        widget.onFileChanged(_imageFile);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _getImageFromGallery,
      child: Container(
        width: 350,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // صورة الخلفية
            if (_imageFile != null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: FileImage(_imageFile!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            // الأيقونة الافتراضية
            if (_imageFile == null)
              const Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
            // زر الإغلاق
            if (_imageFile != null)
              Positioned(
                top: 8,
                left: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _imageFile = null;
                      widget.onFileChanged(null);
                    });
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
