import 'dart:convert';

import 'package:exam_musicplayce/models/use_model.dart';
import 'package:exam_musicplayce/modules/themes/app_colors.dart';
import 'package:exam_musicplayce/modules/themes/preferences_keys.dart';
import 'package:exam_musicplayce/modules/themes/text_styles.dart';
import 'package:exam_musicplayce/modules/widgets/button_styled.dart';
import 'package:exam_musicplayce/modules/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameInputController = TextEditingController();
  TextEditingController mailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController confirmInputController = TextEditingController();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: const BackButton(
            color: AppColors.input,
          ),
        ),
        body: Container(
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
          child: Form(
            child: Column(
              children: [
                Expanded(
                  flex: 8,
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
                        label: "Nome",
                        icon: Icons.person_pin_rounded,
                        obscureText: false,
                        textController: nameInputController,
                      ),
                      TextFieldWidget(
                        label: "Email",
                        icon: Icons.inbox_rounded,
                        obscureText: false,
                        textController: mailInputController,
                      ),
                      TextFieldWidget(
                        label: "Senha",
                        icon: Icons.lock_rounded,
                        obscureText: !showPassword,
                        textController: passwordInputController,
                      ),
                      TextFieldWidget(
                        label: "Confirme a senha",
                        icon: Icons.lock_rounded,
                        obscureText: !showPassword,
                        textController: confirmInputController,
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
                                onChanged: (bool? value) {
                                  setState(() {
                                    showPassword = value!;
                                  });
                                },
                              ),
                              data: ThemeData(
                                  unselectedWidgetColor: AppColors.subtitle),
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
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonStyledWidget(
                        label: 'Criar Conta',
                        call: () {
                          SignUp();
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  // ignore: non_constant_identifier_names
  void SignUp() {
    User newUser = User(
      name: nameInputController.text,
      mail: mailInputController.text,
      password: passwordInputController.text,
      keepOn: true,
    );

    // ignore: avoid_print
    print(newUser);
    saveUser(newUser);
  }

  void saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKeys.activeUser,
      json.encode(
        user.toJson(),
      ),
    );
  }
}
