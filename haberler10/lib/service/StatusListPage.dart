
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haberler10/service/status_service.dart';

class StatusListPage extends StatefulWidget {
  const StatusListPage({Key? key}) : super(key: key);

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
                    height: size.height * .9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(mypost['image']),
                                radius: size.height * 0.08,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "${mypost['title']}",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "${mypost['content']}",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "${mypost['category']}",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "${mypost['date']}",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
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
}
