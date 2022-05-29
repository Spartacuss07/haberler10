import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:haberler10/sabitler/ex.dart';
import 'package:haberler10/sabitler/tema.dart';
import 'package:haberler10/service/auth.dart';
import 'adminenter2.dart';

class adminenter extends StatefulWidget {
  const adminenter({Key? key}) : super(key: key);

  @override
  State<adminenter> createState() => _adminenterState();
}

class _adminenterState extends State<adminenter> {
  TextEditingController t1 = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Tema tema = Tema();
  bool sifre_gozukme = false;
  final _firestore = FirebaseFirestore.instance;
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          /*appBar: AppBar(
            title: const Text("YÖNETİCİ GİRİŞ EKRANI"),
            centerTitle: true,
          ),*/

          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: renk(arka_renk),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 180,
                    height: 180,
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                          color: renk("2D2F3A"),
                          width: 15,
                        ),
                      ),
                      child: Icon(
                          Icons.login,
                          size: 45,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Giriş Yapın",
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                  ),
                  Container(
                    decoration: tema.inputBoxDec(),
                    margin: EdgeInsets.only(top: 30, bottom: 10, right: 30, left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: TextFormField(
                      controller: _userNameController,
                      decoration: tema.inputDec("E-mail adresini girin", Icons.people_alt_outlined),
                      style: GoogleFonts.quicksand(
                        color: renk(metin_renk),
                      ),
                    ),
                  ),
                  Container(
                    decoration: tema.inputBoxDec(),
                    margin: EdgeInsets.only(top: 5, bottom: 30, right: 30, left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: sifre_gozukme,
                            decoration: tema.inputDec("Şifrenizi Girin", Icons.vpn_key_outlined),
                            style: GoogleFonts.quicksand(
                              color: renk(metin_renk),
                              letterSpacing: 5,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              sifre_gozukme = !sifre_gozukme;
                            });
                          },
                          icon: Icon(
                            sifre_gozukme? Icons.remove_red_eye : Icons.close,
                            color: renk("7F8C99"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //var response = await userRef.get();
                      //var map = response.data();

                      _authService.signIn(_userNameController.text, _passwordController.text)
                      .then((value) {
                        return Navigator.push(context, MaterialPageRoute(builder: (context) =>  const adminenter2()));
                      });


                      //admingiris2();

                      /*_authService.signIn(_emailController.text, _passwordController.text).then((user) {
                        return Navigator.push(context, MaterialPageRoute(builder: (context) => adminenter2()));
                      });*/
                    },
                    child: Container(
                      //margin: EdgeInsets.only(right: 50, left: 50),
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          renk("4E73DF"),
                              renk("224ABE"),
                        ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                        ),

                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                          color: renk("2D2F3A"),
                          offset: Offset(1,5),
                            blurRadius: 5,
                        ),
                        ],

                      ),
                      child: Center(
                        child: Text(
                            "GİRİŞ YAP",
                            style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontSize: 20,
                            ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
/*
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'ANASAYFA',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'YÖNETİCİ GİRİŞ',
              ),
            ],
            selectedItemColor: Colors.amber[800],
            onTap: (int i) {
              switch (i) {
                case 0:



                  break;

                case 1:


                  break;
              }
            },
          ),*/
        ),
    ),
    );

  }

  /*void admingiris2() {
    print(_userNameController.text);
    //WidgetsFlutterBinding.ensureInitialized();
    //await Firebase.initializeApp();
    FirebaseFirestore.instance
        .collection("Person")
        .doc("user")
        .get()
        .then((value) {
      setState(() {
        userName = value.data()["userName"];
        password = value.data()["password"];

      });
    });
    print(userName);
    print(password);
    /*if(_userNameController.text == userName && _passwordController.text == password)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  const adminenter2()));

      }
    else
      {
        print("mustafa");
      }
    print("eska");*/
    //Navigator.push(context, MaterialPageRoute(builder: (context) =>  const adminenter2()));
  }*/
}
