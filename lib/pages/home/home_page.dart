import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_musicplayce/pages/login/login_page.dart';
import 'package:exam_musicplayce/pages/note/create_note.dart';
import 'package:exam_musicplayce/shared/themes/app_colors.dart';
import 'package:exam_musicplayce/shared/themes/text_styles.dart';
import 'package:exam_musicplayce/shared/widgets/button_styled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Note').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final size = MediaQuery.of(context).size;
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
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
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

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
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          return ListTile(
                            title: Text(
                              data['title'],
                              style: TextStyles.subtitle,
                            ),
                            subtitle:
                                Text(data['company'], style: TextStyles.input),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          ButtonStyledWidget(
                            label: "Sair",
                            call: () {
                              _signOut();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            theme: "transparent",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 30),
                            child: ButtonStyledWidget(
                              label: "Criar nota",
                              call: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CreateNote()),
                                );
                              },
                              theme: "secondary",
                            ),
                          )
                        ],
                      ))
                ],
              )),
        );
      },
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
