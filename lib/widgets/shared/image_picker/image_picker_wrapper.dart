import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:goateam/widgets/shared/image_picker/image_picker_source_selector.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWrapper extends StatefulWidget {
  final Uint8List _rawImage;
  final void Function(Uint8List) _imagePickerCallback;

  ImagePickerWrapper(this._rawImage, this._imagePickerCallback);

  @override
  _ImagePickerWrapperState createState() => _ImagePickerWrapperState();
}

class _ImagePickerWrapperState extends State<ImagePickerWrapper> {
  final ImagePicker _picker = ImagePicker();

  Uint8List _imageFile;
  dynamic _pickImageError;

  @override
  void initState() {
    super.initState();

    _imageFile = widget._rawImage;
  }

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
                      color: Color(0xffecf0f1),
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
        widget._imagePickerCallback(_imageFile);
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
