import 'dart:io';
import 'package:haberler10/sabitler/ex.dart';
import 'package:haberler10/sabitler/tema.dart';
import 'package:haberler10/service/status_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class adminenter2 extends StatefulWidget {
  const adminenter2({Key? key}) : super(key: key);

  @override
  State<adminenter2> createState() => _adminenter2State();
}

class _adminenter2State extends State<adminenter2> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();

  var _id = "";
  var _baslik = "";
  var _icerik = "";
  var _category = "";
  var _date = "";


  late String id, baslik, icerik, category, date;
  StatusService _statusService = StatusService();

  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  var profileImage;

  Widget imagePlace() {
    double height = MediaQuery.of(context).size.height;
    if (profileImage != null) {
      return CircleAvatar(
          backgroundImage: FileImage(File(profileImage!.path)),
          radius: height * 0.08);
    } else {
      if (_pickImage != null) {
        return CircleAvatar(
          backgroundImage: NetworkImage(_pickImage),
          radius: height * 0.08,
        );
      } else
        return CircleAvatar(
          backgroundImage: AssetImage("assets/siyah.png"),
          radius: height * 0.08,
        );
    }
  }







  idAl(idTut) {
    id = idTut;
  }

  baslikAl(baslikTut) {
    baslik = baslikTut;
  }

  icerikAl(icerikTut) {
    icerik = icerikTut;
  }

  categoryAl(categoryTut) {
    category = categoryTut;
  }

  dateAl(dateTut) {
    date = dateTut;
  }



  @override
  Widget build(BuildContext context) {
    Tema tema = Tema();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HABERLER"),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: renk(arka_renk),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Center(child: imagePlace(),),
                  /*Container(
                    decoration: tema.inputBoxDec(),
                    margin: EdgeInsets.only(top: 20, bottom: 10, right: 30, left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: TextField(

                      controller: t1,
                      onChanged: (String idTut) {
                        idAl(idTut);
                      },
                      decoration: tema.inputDec1("No"),
                      style: GoogleFonts.quicksand(
                        color: renk(metin_renk),
                      ),
                    ),
                  ),*/
                  const SizedBox(height: 5),
                  Container(
                    decoration: tema.inputBoxDec(),
                    margin: EdgeInsets.only(top: 20, bottom: 10, right: 30, left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: TextField(
                      controller: t2,
                      onChanged: (String baslikTut) {
                        baslikAl(baslikTut);
                      },
                      decoration: tema.inputDec1("Başlık"),
                      style: GoogleFonts.quicksand(
                        color: renk(metin_renk),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: tema.inputBoxDec(),
                    margin: EdgeInsets.only(top: 20, bottom: 10, right: 30, left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: TextFormField(
                      controller: t3,
                      onChanged: (String icerikTut) {
                        icerikAl(icerikTut);
                      },
                      decoration: tema.inputDec1("İçerik"),
                      style: GoogleFonts.quicksand(
                        color: renk(metin_renk),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: tema.inputBoxDec(),
                    margin: EdgeInsets.only(top: 20, bottom: 10, right: 30, left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: TextFormField(
                      controller: t4,
                      onChanged: (String categoryTut) {
                        categoryAl(categoryTut);
                      },

                      decoration: tema.inputDec1("Kategori"),
                      style: GoogleFonts.quicksand(
                        color: renk(metin_renk),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: tema.inputBoxDec(),
                    margin: EdgeInsets.only(top: 20, bottom: 20, right: 30, left: 30),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    child: TextFormField(
                      controller: t5,
                      onChanged: (String dateTut) {
                        dateAl(dateTut);
                      },
                      decoration: tema.inputDec1("Tarih"),
                      style: GoogleFonts.quicksand(
                        color: renk(metin_renk),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  SizedBox(
                    child: Container(

                      margin: EdgeInsets.only(left: 20),
                      child: Row(

                        children: [

                          InkWell(
                            onTap: (){
                              /*_statusService.addStatus(profileImage, t2.text, t3.text, t4.text, t5.text).then((value) {
                                Fluttertoast.showToast(msg: "Durum eklendi");
                              });*/
                              _statusService.addStatus( t2.text, t3.text, t4.text, t5.text, profileImage ?? '').then((value) {
                                Fluttertoast.showToast(
                                    msg: "Durum eklendi!",
                                    timeInSecForIosWeb: 2,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.grey[600],
                                    textColor: Colors.white,
                                    fontSize: 14);
                                Navigator.pop(context);
                              });
                              //veriEkle();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              //margin: EdgeInsets.only(right: 50, left: 50),
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
                                  "EKLE",
                                  style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /*ElevatedButton(
                            onPressed: () {
                              veriEkle();
                            },

                            child: Container(

                                padding: EdgeInsets.all(10),

                                child: const Text("EKLE")
                            ),
                                style: ElevatedButton.styleFrom(
                                    primary: renk("4E73DF"),
                                    onPrimary: renk("224ABE"),
                                  shadowColor: renk("2D2F3A"),


                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),

                                    ),
                                textStyle: const TextStyle(fontSize: 20),
                                elevation: 5),
                          ),*/
                          const SizedBox(width: 10),
                          /*ElevatedButton(
                            onPressed: () {
                              veriOku();
                            },
                            child: const Text("OKU"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                shadowColor: Colors.red,
                                //minimumSize:const Size(200, 50),
                                textStyle: const TextStyle(fontSize: 20),
                                elevation: 5),
                          ),*/
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: (){
                              veriGuncelle();
                            },
                            child: Container(
                              //margin: EdgeInsets.only(right: 50, left: 50),
                              //width: MediaQuery.of(context).size.width / 3,
                              padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
                                  "GÜNCELLE",
                                  style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /*ElevatedButton(
                            onPressed: () {
                              veriGuncelle();
                            },
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: const Text("GÜNCELLE")
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: renk("4E73DF"),
                                onPrimary: renk("224ABE"),
                                shadowColor: renk("2D2F3A"),
                                //minimumSize:const Size(200, 50),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                textStyle: const TextStyle(fontSize: 20),
                                elevation: 5),
                          ),*/
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: (){
                              veriSil();
                            },
                            child: Container(
                              //margin: EdgeInsets.only(right: 50, left: 50),
                              width: MediaQuery.of(context).size.width / 4,
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
                                  "SİL",
                                  style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /*ElevatedButton(
                            onPressed: () {
                              veriSil();
                            },
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: const Text("SİL")),
                            style: ElevatedButton.styleFrom(

                                primary: renk("4E73DF"),
                                onPrimary: renk("224ABE"),
                                shadowColor: renk("2D2F3A"),
                                //minimumSize:const Size(200, 50),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                textStyle: const TextStyle(fontSize: 20),
                                elevation: 5),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () => _onImageButtonPress(ImageSource.camera, context: context),
                          child: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Colors.blue,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () => _onImageButtonPress(ImageSource.gallery, context: context),
                          child: Icon(
                            Icons.image,
                            size: 30,
                            color: Colors.blue,
                          ))
                    ],
                  )
                  /*SizedBox(
                    child: Text(
                      t1.text + "  " + t2.text,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: Text(
                      t3.text,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: Text(
                      t4.text,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: Text(
                      t5.text,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),*/
                  //const SizedBox(height: 10),

                  //const SizedBox(height: 10),

                  //const SizedBox(height: 10),

                  //const SizedBox(width: 10),

                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  void veriEkle() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    DocumentReference veriyolu =
    FirebaseFirestore.instance.collection("haberler").doc(id);

    Map<String, dynamic> edebiyat = {
      "id": id,
      "icerik": t3.text,
      "kategori": t4.text,
      "tarih": t5.text,
      "baslik": t2.text,
    };
    veriyolu.set(edebiyat).whenComplete(() {
      Fluttertoast.showToast(msg: id + "li mesaj eklendi");
    });
    t1.text = "";
    t2.text = "";
    t3.text = "";
    t4.text = "";
    t5.text = "";
  }

  /*void veriOku() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore.instance
        .collection("haberler")
        .doc(t1.text)
        .get()
        .then((gelenVeri) {
      setState(() {
        _id = gelenVeri.data()["id"];
        _baslik = gelenVeri.data()["baslik"];
        _icerik = gelenVeri.data()["icerik"];
        _category = gelenVeri.data()["kategori"];
        _date = gelenVeri.data()["tarih"];

        t1.text = _id;
        t2.text = _baslik;
        t3.text = _icerik;
        t4.text = _category;
        t5.text = _date;
      });
    });

  }*/

  void veriGuncelle()  {
    /*WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();*/

    DocumentReference veriGuncellemeYolu = FirebaseFirestore.instance
        .collection("haberler")
        .doc(t1.text);

    Map<String, dynamic> guncelenecekVeri = {

      "id": id,
      "icerik": t3.text,
      "kategori": t4.text,
      "tarih": t5.text,
      "baslik": t2.text,

    };
    veriGuncellemeYolu.update(guncelenecekVeri).whenComplete(() {
      Fluttertoast.showToast(msg: id.toString() + "li veriniz guncellendi");
    });





  }



  void veriSil() {
    setState(() {
      DocumentReference silinecekVeri =
      FirebaseFirestore.instance.collection("haberler").doc(id);
      silinecekVeri.delete().whenComplete(() {
        Fluttertoast.showToast(msg: id + "li veriniz silindi");
      });

      t1.text = "";
      t2.text = "";
      t3.text = "";
      t4.text = "";
      t5.text = "";
    });



  }
  void _onImageButtonPress(ImageSource source, {required BuildContext context}) async{
    try{
      final pickedFile = await _pickerImage.pickImage(source: source);
      setState(() {
        profileImage = pickedFile!;
        print("resim ekleme");
        if(profileImage != null) {}
      });
      print("aaa");
    }catch(e){
      setState(() {
        _pickImage = e;
        print("Image Error: " + _pickImage);
      });
    }
  }
}