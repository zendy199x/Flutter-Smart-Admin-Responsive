import 'package:flutter/material.dart';
import 'package:smart_admin/core/constants/color_constants.dart';
import 'package:smart_admin/screens/forms/components/add_new_widget.dart';

class FormMaterial extends StatefulWidget {
  const FormMaterial({Key? key}) : super(key: key);

  @override
  _FormMaterialState createState() => _FormMaterialState();
}

class _FormMaterialState extends State<FormMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Card(
          color: bgColor,
          elevation: 5,
          margin: const EdgeInsets.fromLTRB(32, 32, 64, 32),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Column(
                children: const [
                  Center(
                    child: Text("What you want to add? Select from below?"),
                  ),
                  SelectionSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
