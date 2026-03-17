import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageInput extends StatefulWidget{
  const ImageInput({super.key , required this.onSelectedImage});

  final void Function(File image) onSelectedImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput>{

  File? _takenImage;

  void _takePicture() async {
     final imagePicker =  ImagePicker();

     final pickedImage = await imagePicker.pickImage(source: ImageSource.camera , maxWidth: 600);

      if (pickedImage == null) {
        return;
      }
      // print(pickedImage.path);

      setState((){
      _takenImage = File(pickedImage.path);
      });
  
     widget.onSelectedImage(_takenImage!);
  }

  @override
  Widget build(BuildContext context) {

    Widget content = TextButton.icon(onPressed: _takePicture, label: Text('Add Image'), icon: Icon(Icons.camera),);

    if( _takenImage != null){
      content = GestureDetector(onTap: _takePicture ,child: Image.file(_takenImage! , fit: BoxFit.cover , width: double.infinity,));
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1 , color: Colors.grey),
      ),
      height: 250,
      width: double.infinity ,
      alignment: Alignment.center,
      child: content);
  }
}