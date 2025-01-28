import 'package:examples/services/classes/el.dart';
import 'package:flutter/material.dart';

class AddingEl extends StatefulWidget {
  const AddingEl({super.key});

  @override
  State<AddingEl> createState() => _AddingElState();
}

class _AddingElState extends State<AddingEl> {
  final titleController = TextEditingController();
  final mainTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[200],
          title: Text("Add the element"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter title of element',
                      labelText: 'Title'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                child: TextFormField(
                  controller: mainTextController,
                  maxLines: 7,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Write some text (Optional)",
                    labelText: "Main text",
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color?>(
                            Colors.purple[400])),
                    onPressed: () {
                      if (titleController.text == null ||
                          titleController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text(
                                "Wrong Input",
                                textAlign: TextAlign.center,
                              ),
                              alignment: Alignment.center,
                            );
                          },
                        );
                      } else {
                        Navigator.pop(
                          context,
                          El(
                            title: titleController.text,
                            text: mainTextController.text,
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text(
                        "Add element",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
