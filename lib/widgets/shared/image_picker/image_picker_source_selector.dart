import 'package:flutter/material.dart';
import 'package:goateam/widgets/shared/image_picker/image_picker_source_selector_tile.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerSourceSelector extends StatefulWidget {
  final void Function(ImageSource) _onSelectSource;

  ImagePickerSourceSelector(this._onSelectSource);

  @override
  _ImagePickerSourceSelectorState createState() =>
      _ImagePickerSourceSelectorState();
}

class _ImagePickerSourceSelectorState extends State<ImagePickerSourceSelector> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: new Wrap(
          children: <Widget>[
            ImagePickerSourceSelectorTile('Gallery', Icons.photo,
                ImageSource.gallery, widget._onSelectSource),
            ImagePickerSourceSelectorTile('Camera', Icons.camera_alt,
                ImageSource.camera, widget._onSelectSource),
          ],
        ),
      ),
    );
  }
}
