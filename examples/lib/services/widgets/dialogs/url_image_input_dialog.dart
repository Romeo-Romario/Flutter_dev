import 'package:flutter/material.dart';

class UrlImageInputDialog extends StatefulWidget {
  const UrlImageInputDialog({super.key});

  @override
  State<UrlImageInputDialog> createState() => _UrlImageInputDialogState();

  static Future<String?> showAsDialog({
    required BuildContext context,
    String? pastUrl,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return UrlImageInputDialog();
      },
    );
  }
}

class _UrlImageInputDialogState extends State<UrlImageInputDialog> {
  final urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(vertical: 300, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: TextFormField(
              controller: urlController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input url to image'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, urlController.text.trim());
            },
            // ignore: sort_child_properties_last
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Submit",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color?>(Colors.purple[400]),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }
}
