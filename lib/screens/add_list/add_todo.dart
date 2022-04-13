import 'package:flutter/material.dart';
import 'dart:async';

import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class Addtodo extends StatefulWidget {
  @override
  _AddtodoState createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  late StreamSubscription _intentDataStreamSubscription;
  List<SharedMediaFile>? _sharedFiles;
  String? _sharedText;

  TextEditingController urlC = TextEditingController();

  @override
  void initState() {
    super.initState();

    // For sharing images coming from outside the app while the app is in the memory
    // _intentDataStreamSubscription = ReceiveSharingIntent.getMediaStream()
    //     .listen((List<SharedMediaFile> value) {
    //   setState(() {
    //     _sharedFiles = value;
    //     print("Shared:" + (_sharedFiles?.map((f) => f.path).join(",") ?? ""));
    //   });
    // }, onError: (err) {
    //   print("getIntentDataStream error: $err");
    // });

    // For sharing images coming from outside the app while the app is closed
    // ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
    //   setState(() {
    //     _sharedFiles = value;
    //     print("Shared:" + (_sharedFiles?.map((f) => f.path).join(",") ?? ""));
    //   });
    // });

    // For sharing or opening urls/text coming from outside the app while the app is in the memory
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      setState(() {
        _sharedText = value;
        print("Shared memory: $_sharedText");
        urlC.text = _sharedText ?? '';
      });
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialText().then((String? value) {
      setState(() {
        _sharedText = value;
        print("Shared closed: $_sharedText");
        urlC.text = _sharedText ?? '';
      });
    });
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textStyleBold = const TextStyle(fontWeight: FontWeight.bold);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("Shared files:", style: textStyleBold),
              Text(_sharedFiles
                      ?.map((f) =>
                          "{Path: ${f.path}, Type: ${f.type.toString().replaceFirst("SharedMediaType.", "")}}\n")
                      .join(",\n") ??
                  ""),
              SizedBox(height: 100),
              Text("Details", style: textStyleBold),
              // Text(_sharedText ?? ""),

              TextFormField(
                maxLines: 25,
                minLines: 8,
                controller: urlC,
                decoration: InputDecoration(
                    labelText: "Enter Details",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







// Firebase add Data Code or esk next jo ha wo editer k design ka code ha comment me


// import 'package:flutter/material.dart';
// import 'package:research_alert/firebase_services/database_services.dart';

// class Addtodo extends StatelessWidget {
//   Addtodo({Key? key}) : super(key: key);

//   TextEditingController titleC = TextEditingController();
//   TextEditingController detailC = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//         actionsIconTheme: const IconThemeData(color: Colors.black),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.push_pin_outlined,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.notifications_outlined,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.dashboard_outlined,
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: titleC,
//                   validator: (v) {
//                     if (v!.isEmpty) {
//                       return "Please enter title";
//                     }

//                     return null;
//                   },
//                   decoration: InputDecoration(
//                       labelText: "Enter Title",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: detailC,
//                   maxLines: 25,
//                   minLines: 3,
//                   validator: (v) {
//                     if (v!.isEmpty) {
//                       return "Please enter details";
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                       labelText: "Enter Details",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(
//                             const Color.fromARGB(255, 34, 215, 228)),
//                         minimumSize: MaterialStateProperty.all(
//                             const Size(double.infinity, 40))),
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         DataBaseServices.addData(titleC.text, detailC.text);
//                       }
//                     },
//                     child: const Text("ADD"))
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }








// only design code




// import '../../models/list_model.dart';
// import 'package:research_alert/screens/add_list/add_todo.dart';
// // import 'package:todo_app/model/list_model.dart';

// class Addtodo extends StatefulWidget {
//   const Addtodo({Key? key}) : super(key: key);

//   @override
//   _AddtodoState createState() => _AddtodoState();
// }

// class _AddtodoState extends State<Addtodo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//         actionsIconTheme: const IconThemeData(color: Colors.black),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.push_pin_outlined,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.notifications_outlined,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.dashboard_outlined,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         height: 100,
//         decoration: BoxDecoration(color: Colors.white, boxShadow: [
//           BoxShadow(
//             color: Colors.blue.withOpacity(0.5),
//             spreadRadius: 2.0,
//             blurRadius: 8.0,
//           )
//         ]),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 const Spacer(),
//                 InkWell(
//                   onTap: () {},
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.blue.withOpacity(0.5),
//                             spreadRadius: 2.0,
//                             blurRadius: 8.0,
//                           )
//                         ]),
//                     padding: const EdgeInsets.all(10.0),
//                     child: const Icon(
//                       Icons.check,
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 Row(
//                   children: List.generate(
//                       products.length, (index) => colorSelection(index)),
//                 ),
//                 const Spacer(),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             //title
//             TextFormField(
//               style: const TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 20,
//               ),
//               decoration: const InputDecoration(
//                 hintText: "Enter title",
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),

//             TextFormField(
//               style: const TextStyle(fontSize: 16, color: Colors.black),
//               decoration: const InputDecoration(
//                 hintText: "Enter description",
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Padding colorSelection(int index) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10.0),
//       child: InkWell(
//         onTap: () {},
//         child: Container(
//           height: 30,
//           width: 30,
//           decoration: BoxDecoration(
//               color: products[index].color,
//               borderRadius: BorderRadius.circular(10.0)),
//         ),
//       ),
//     );
//   }
// }
