// firebase add data code




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'database_services.dart';

// class ShowDataPage extends StatelessWidget {
//   const ShowDataPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//           stream: firebaseFirestore.collection('notes').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final res = snapshot.data!.docs[index];
//                   return Card(
//                       child: ExpansionTile(
//                     title: Text(
//                       "${res['title']}",
//                     ),
//                     // subtitle: IconButton(onPressed: () {}, icon: const Icon (Icons.edit),),
//                   ));
//                 },
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     );
//   }
// }
