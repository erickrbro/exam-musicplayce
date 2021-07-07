//@dart=2.9
import 'package:exam_musicplayce/pages/home/home_page.dart';
import 'package:exam_musicplayce/shared/themes/text_styles.dart';
import 'package:exam_musicplayce/shared/widgets/button_styled.dart';
import 'package:exam_musicplayce/shared/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../login/login_page.dart';
import '../../shared/themes/app_colors.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final color3 = const Color(0xFF38BF68);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final TextEditingController _confirmInputController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: color3,
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                        flex: 6,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 80),
                              child: Text(
                                'Vamos criar uma conta.',
                                style: TextStyles.title,
                              ),
                            ),
                            TextFieldWidget(
                              label: "Email",
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
                              icon: Icons.lock_rounded,
                              obscureText: !showPassword,
                              textController: _passwordInputController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Preencha os campos corretamente';
                                }
                                return null;
                              },
                            ),
                            TextFieldWidget(
                              label: "Confirme a senha",
                              icon: Icons.lock_rounded,
                              obscureText: !showPassword,
                              textController: _confirmInputController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Preencha os campos corretamente';
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Theme(
                                    child: Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      value: showPassword,
                                      onChanged: (bool value) {
                                        setState(() {
                                          showPassword = value;
                                        });
                                      },
                                    ),
                                    data: ThemeData(
                                        unselectedWidgetColor:
                                            AppColors.subtitle),
                                  ),
                                  Text(
                                    'Mostrar senha?',
                                    style: TextStyles.checkbox,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonStyledWidget(
                              label: 'Cancelar',
                              call: () {
                                Navigator.pop(context);
                              },
                              theme: "secondary",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 30),
                              child: ButtonStyledWidget(
                                label: 'Criar Conta',
                                call: () {
                                  if (_formKey.currentState.validate()) {
                                    _register();
                                    Navigator.pop(context);
                                  }
                                },
                                theme: "primary",
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  void _register() async {
    String email = _mailInputController.text.trim();
    String password = _passwordInputController.text.trim();
    String confirmpassword = _confirmInputController.text.trim();
    if (password == confirmpassword) {
      try {
        final User user = (await _auth.createUserWithEmailAndPassword(
                email: email, password: password))
            .user;
        setState(() {
          if (user != null) {
            Fluttertoast.showToast(msg: "Usuario Criado");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        });
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    } else {
      Fluttertoast.showToast(msg: "As senhas não são iguais");
    }
  }
}
