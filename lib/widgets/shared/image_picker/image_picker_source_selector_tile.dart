import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerSourceSelectorTile extends StatefulWidget {
  final String _labelText;
  final IconData _labelIcon;
  final ImageSource _imageSource;
  final void Function(ImageSource) _onSelectSource;

  ImagePickerSourceSelectorTile(this._labelText, this._labelIcon,
      this._imageSource, this._onSelectSource);

  @override
  _ImagePickerSourceSelectorTileState createState() =>
      _ImagePickerSourceSelectorTileState();
}

class _ImagePickerSourceSelectorTileState
    extends State<ImagePickerSourceSelectorTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(widget._labelIcon),
        title: Text(widget._labelText),
        onTap: () {
          widget._onSelectSource(widget._imageSource);
          Navigator.of(context).pop();
        });
  }
}
