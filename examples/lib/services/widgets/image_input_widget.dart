import 'package:flutter/material.dart';
import 'package:image_input/image_input.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageInputWidget extends StatefulWidget {
  const ImageInputWidget({super.key});

  @override
  State<ImageInputWidget> createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  List<XFile> imageInputImages = [];
  bool allowEditImageInput = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                shape: const RoundedRectangleBorder(),
                title: const Text("Options"),
                children: [
                  Row(
                    children: [
                      const Text("Allow Edit"),
                      const SizedBox(
                        width: 20,
                      ),
                      Switch(
                        value: allowEditImageInput,
                        onChanged: (value) {
                          setState(() {
                            allowEditImageInput = value;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Center(
            child: Text(
              "Image Input",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: ImageInput(
              images: imageInputImages,
              allowEdit: allowEditImageInput,
              allowMaxImage: 5,
              getPreferredCameraDevice: () async =>
                  await getPrefferedCameraDevice(context),
              getImageSource: () async => await getImageSource(context),
              onImageSelected: (image) {
                setState(() {
                  imageInputImages.add(image);
                });
              },
              onImageRemoved: (image, index) {
                setState(() {
                  imageInputImages.remove(image);
                });
              },
              loadingBuilder: (context, progress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

var getImageSource = (BuildContext context) {
  return showDialog<ImageSource>(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: [
          SimpleDialogOption(
            child: const Text("Camera"),
            onPressed: () {
              Navigator.of(context).pop(ImageSource.camera);
            },
          ),
          SimpleDialogOption(
              child: const Text("Gallery"),
              onPressed: () {
                Navigator.of(context).pop(ImageSource.gallery);
              }),
        ],
      );
    },
  ).then((value) {
    return value ?? ImageSource.gallery;
  });
};

var getPrefferedCameraDevice = (BuildContext context) async {
  var status = await Permission.camera.request();
  if (status.isDenied) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Allow Camera Permission"),
      ),
    );
    return null;
  }
  return showDialog<CameraDevice>(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: [
          SimpleDialogOption(
            child: const Text("Rear"),
            onPressed: () {
              Navigator.of(context).pop(CameraDevice.rear);
            },
          ),
          SimpleDialogOption(
              child: const Text("Front"),
              onPressed: () {
                Navigator.of(context).pop(CameraDevice.front);
              }),
        ],
      );
    },
  ).then(
    (value) {
      return value ?? CameraDevice.rear;
    },
  );
};
