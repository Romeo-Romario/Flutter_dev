import 'dart:io';
import 'package:examples/services/models/image_source_type.dart';
import 'package:examples/services/widgets/dialogs/url_image_input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatefulWidget {
  final void Function(String imagePath) onImagepathChanged;
  final void Function(ImageSourceType imageSourceType) onImageSourceTypeChanged;

  const ImagePickerView({
    super.key,
    required this.onImagepathChanged,
    required this.onImageSourceTypeChanged,
  });

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  final ImagePicker _picker = ImagePicker();

  Image? selectedImage;
  ImageSourceType selectedType = ImageSourceType.local;

  @override
  Widget build(BuildContext context) {
    final sourceTypes = ImageSourceType.values
        .where(
          (element) => element != ImageSourceType.asset,
        )
        .toList();

    return Column(
      spacing: 20,
      children: [
        InkWell(
          onTap: _onTap,
          child: Container(
            width: 200,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust the radius as needed
            ),
            child: selectedImage ??
                Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.white,
                  size: 40,
                ),
          ),
        ),
        // SizedBox(height: 20,),
        Container(
          width: 250,
          child: SegmentedButton(
            segments: List.generate(
              sourceTypes.length,
              (index) {
                return ButtonSegment(
                  value: sourceTypes[index],
                  label: Text(sourceTypes[index].name),
                );
              },
            ),
            selected: {selectedType},
            onSelectionChanged: (p0) => setState(() {
              selectedType = p0.first;
            }),
          ),
        ),
      ],
    );
  }

  Future _onTap() async {
    final image = await switch (selectedType) {
      ImageSourceType.web => _selectImageFromWeb(),
      ImageSourceType.asset => _selectImageFromWeb(),
      ImageSourceType.local => _selectImageFromGallery(),
    };

    setState(() {
      widget.onImageSourceTypeChanged(selectedType);
      selectedImage = image;
    });
  }

  Future<Image?> _selectImageFromWeb() async {
    final urlText = await UrlImageInputDialog.showAsDialog(context: context);
    try {
      if (urlText == null || urlText.trim().isEmpty) {
        return null;
      }
      widget.onImagepathChanged(urlText);
      // TODO: Fix this
      return Image.network(
        urlText,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      );
    } catch (e) {
      return null;
    }
  }

  Future<Image?> _selectImageFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return null;
    }
    widget.onImagepathChanged(pickedFile.path);
    final imageFile = File(pickedFile.path);
    return Image.file(imageFile, width: 200, height: 200, fit: BoxFit.cover);
  }
}
