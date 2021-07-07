import 'package:exam_musicplayce/shared/themes/app_colors.dart';
import 'package:exam_musicplayce/shared/themes/text_styles.dart';
import 'package:exam_musicplayce/shared/widgets/button_styled.dart';
import 'package:exam_musicplayce/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final TextEditingController _titleInputController = TextEditingController();
  final TextEditingController _descriptionInputController =
      TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('Note');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(-1, 1.5),
              colors: [AppColors.gradintShader, AppColors.background],
              radius: 1.0,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          'Preencha os dados para criar uma nova nota',
                          style: TextStyles.title,
                        ),
                      ),
                      TextFieldWidget(
                        label: "Titulo",
                        icon: Icons.edit,
                        obscureText: false,
                        textController: _titleInputController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: Text(
                          'Descrição',
                          style: TextStyles.input,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      TextFieldWidget(
                        obscureText: false,
                        textController: _descriptionInputController,
                        maxLines: 8,
                      ),
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      ButtonStyledWidget(
                        call: () {
                          Navigator.pop(context);
                        },
                        label: "Cancelar",
                        theme: "secondary",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: ButtonStyledWidget(
                          call: () {
                            Navigator.pop(context);
                            addUser();
                          },
                          label: "Nova nota",
                          theme: "primary",
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'title': _titleInputController.text.trim(), // John Doe
          'company': _descriptionInputController.text.trim(), // Stokes and Sons
        })
        .then((value) => Fluttertoast.showToast(msg: "Nota Adicionada"))
        .catchError((error) => Fluttertoast.showToast(msg: error.toString()));
  }
}
