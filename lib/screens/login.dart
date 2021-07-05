import 'package:exam_musicplayce/modules/themes/app_colors.dart';
import 'package:exam_musicplayce/modules/themes/text_styles.dart';
import 'package:exam_musicplayce/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
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
                    child: Form(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            autofocus: true,
                            style: TextStyles.input,
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: AppColors.input,
                                ),
                                contentPadding: EdgeInsets.all(25),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.inbox_rounded,
                                    color: AppColors.border,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                    width: 2.0,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.border,
                                    width: 2.0,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextFormField(
                            style: TextStyles.input,
                            decoration: const InputDecoration(
                                labelText: 'Senha',
                                labelStyle: TextStyle(
                                  color: AppColors.input,
                                ),
                                contentPadding: EdgeInsets.all(25),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.lock_rounded,
                                    color: AppColors.border,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                    width: 2.0,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.border,
                                    width: 2.0,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                )),
                          ),
                        ),
                      ],
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('funcionou');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 10),
                      child: Text(
                        'Esqueceu a senha?',
                        style: TextStyles.caption,
                        textAlign: TextAlign.right,
                      ),
                    ),
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
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          data: ThemeData(
                              unselectedWidgetColor: AppColors.subtitle),
                        ),
                        Text(
                          'Continuar conectado?',
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
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
                        onPressed: () {},
                        child: const Text(
                          'Login',
                          style: TextStyle(color: AppColors.background),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}