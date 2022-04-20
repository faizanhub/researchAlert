// just color and design of containers jo note add hn ga

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Notes {
  String title;
  String desc;
  Timestamp createdAt;
  Timestamp reminder;

  Notes({
    required this.title,
    required this.desc,
    required this.createdAt,
    required this.reminder,
  });

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      title: json['title'],
      desc: json['detail'],
      createdAt: json['createdAt'],
      reminder: json['reminder'],
    );
  }
}

// List<Product> products = [
//   Product(
//     title: "Title",
//     color: const Color.fromARGB(255, 115, 205, 253),
//     desc:
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
//   ),
//   Product(
//     title: "Title",
//     color: const Color(0xFFff6374),
//     desc:
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
//   ),
//   Product(
//     title: "Title",
//     color: const Color(0xFFffaa5b),
//     desc:
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
//   ),
//   Product(
//     title: "Title",
//     color: const Color.fromARGB(255, 115, 205, 253),
//     desc:
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
//   ),
//   Product(
//     title: "Title",
//     color: const Color.fromARGB(255, 115, 205, 253),
//     desc:
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
//   ),
//   Product(
//     title: "Title",
//     color: const Color.fromARGB(255, 115, 205, 253),
//     desc:
//         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
//   ),
// ];
