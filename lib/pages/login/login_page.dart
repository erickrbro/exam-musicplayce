//@dart=2.9
import 'package:exam_musicplayce/pages/home/home_page.dart';
import 'package:exam_musicplayce/pages/sign_up/sign_up_page.dart';
import 'package:exam_musicplayce/shared/themes/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/themes/text_styles.dart';
import '../../shared/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
        key: _formKey,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: AppColors.background,
              body: SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(1, -1),
                      colors: [AppColors.gradintShader, AppColors.background],
                      radius: 1.0,
                    ),
                  ),
                  child: Column(children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Text(
                              'Vamos logar você.',
                              style: TextStyles.title,
                            ),
                          ),
                          Text(
                            'Bem vindo de volta.',
                            style: TextStyles.subtitle,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Você fez falta!',
                            style: TextStyles.subtitle,
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Column(
                              children: [
                                TextFieldWidget(
                                  label: 'Email',
                                  icon: Icons.inbox_rounded,
                                  obscureText: false,
                                  textController: _mailInputController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Preencha os campos corretamente';
                                    }
                                    return null;
                                  },
                                ),
                                TextFieldWidget(
                                  label: "Senha",
                                  icon: Icons.lock,
                                  obscureText: true,
                                  textController: _passwordInputController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Preencha os campos corretamente';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signUp()),
                              );
                            },
                            child: Text(
                              'Não tem uma conta ainda? Registre-se',
                              style: TextStyles.caption,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30, top: 20),
                            child: SizedBox(
                              width: size.width * 0.8,
                              height: size.height * 0.085,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _signInWithEmailAndPassword();
                                    });
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: AppColors.background),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            )));
  }

  Future _signInWithEmailAndPassword() async {
    try {
      final User user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: _mailInputController.text.trim(),
              password: _passwordInputController.text.trim()))
          .user;
      if (user != null) {
        setState(() {
          Fluttertoast.showToast(msg: "Logado com sucesso");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        });
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
