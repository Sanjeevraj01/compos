import 'package:flutter/material.dart';
import 'package:compos/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class searchlist extends StatefulWidget {
  @override
  _searchlistState createState() => _searchlistState();
}

class _searchlistState extends State<searchlist> {
  final controller = TextEditingController();



  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('buildings').snapshots(),
    builder: (context, snapshot) {
        if (snapshot.hasData) {
        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                return Text(doc['name'],
                style: TextStyle(color: Colors.blue));
            });
        } else {
        return Text("No data");
        }
    },
)
      );


  }