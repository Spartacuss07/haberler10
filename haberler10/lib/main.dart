import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:haberler10/service/StatusListPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'adminenter.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Anasayfa(),
  ));
}

/*class StatusListPage extends StatefulWidget {
  const StatusListPage({Key? key}) : super(key: key);

  @override
  State<StatusListPage> createState() => _StatusListPageState();
}

class _StatusListPage extends StatefulWidget {
  const _StatusListPage({Key? key}) : super(key: key);

  @override
  State<StatusListPage> createState() => _StatusListPageState();
}

class _StatusListPageState extends State<StatusListPage> {
  StatusService _statusService = StatusService();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return StreamBuilder(
        stream: _statusService.getStatus(),
        builder: (BuildContext context, AsyncSnapshot snaphot){
          return !snaphot.hasData
              ? CircularProgressIndicator()
              : ListView.builder(
              itemCount: snaphot.data!.docs.length,
              itemBuilder: (context, index){
                DocumentSnapshot mypost = snaphot.data!.docs[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("${mypost['title']}"),
                          Text("${mypost['content']}"),
                          Text("${mypost['category']}"),
                          Text("${mypost['date']}"),
                          SizedBox(height: 10,),
                          /*Center(
                            child: CircleAvatar(
                              backgroundImage: mypost['image'],
                            ),
                          )*/
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        }
    );
  }
}*/


class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HABERLER"),
          centerTitle: true,
        ),

        body: StatusListPage(),

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

                admingiris1();

                break;

              case 1:

                admingiris();

                break;
            }
          },
        ),
      ),
    );


  }

  void admingiris() {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const adminenter()));
  }

  void admingiris1() {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Anasayfa()));
  }
}
