import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:goateam/widgets/shared/image_picker/image_picker_source_selector.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWrapper extends StatefulWidget {
  @override
  _ImagePickerWrapperState createState() => _ImagePickerWrapperState();
}

class _ImagePickerWrapperState extends State<ImagePickerWrapper> {
  Uint8List _imageFile;
  dynamic _pickImageError;
  String _retrieveDataError;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showPicker(context);
        },
        child: CircleAvatar(
          radius: 55,
          backgroundColor: Color(0xffFDCF09),
          child: _imageFile != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.memory(
                    _imageFile,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  width: 200,
                  height: 200,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey[800],
                  ),
                ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return ImagePickerSourceSelector(_onImageButtonPressed);
        });
  }

  void _onImageButtonPressed(ImageSource imgSource) async {
    try {
      final pickedFile = await _picker.getImage(source: imgSource);
      final o = await pickedFile.readAsBytes();

      setState(() {
        _imageFile = o;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  // return Center(
  //   child: defaultTargetPlatform == TargetPlatform.android
  //       ? newMethod()
  //       : _previewImage(),
  // );

  // FutureBuilder<void> newMethod() {
  //   return FutureBuilder<void>(
  //     future: retrieveLostData(),
  //     builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.none:
  //         case ConnectionState.waiting:
  //           return const Text(
  //             'You have not yet picked an image.',
  //             textAlign: TextAlign.center,
  //           );
  //         case ConnectionState.done:
  //           return _previewImage();
  //         default:
  //           if (snapshot.hasError) {
  //             return Text(
  //               'Pick image/video error: ${snapshot.error}}',
  //               textAlign: TextAlign.center,
  //             );
  //           } else {
  //             return const Text(
  //               'You have not yet picked an image.',
  //               textAlign: TextAlign.center,
  //             );
  //           }
  //       }
  //     },
  //   );
  // }

  // Future<void> retrieveLostData() async {
  //   final LostData response = await _picker.getLostData();
  //   if (response.isEmpty) {
  //     return;
  //   }
  //   if (response.file != null) {
  //     if (response.type == RetrieveType.image) {
  //       setState(() {
  //         _imageFile = response.file;
  //       });
  //     }
  //   } else {
  //     _retrieveDataError = response.exception.code;
  //   }
  // }

  // Text _getRetrieveErrorWidget() {
  //   if (_retrieveDataError != null) {
  //     final Text result = Text(_retrieveDataError);
  //     _retrieveDataError = null;
  //     return result;
  //   }
  //   return null;
  // }
}