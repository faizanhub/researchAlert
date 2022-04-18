import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:research_alert/constants/text_styles.dart';
import 'package:research_alert/core/models/notes_model.dart';
import 'dart:math' as math;

class ListCard extends StatelessWidget {
  final Notes notes;
  final VoidCallback press;
  final VoidCallback onLongPress;

  const ListCard({
    required this.notes,
    required this.press,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    String getFormattedDataTime(DateTime dateTime) {
      final myDateTime =
          DateTime.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch);

      var formattedDate = DateFormat('dd MMM yyyy  hh:mm a').format(myDateTime);

      return formattedDate;
    }

    return InkWell(
      onTap: press,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: SizedBox(
          height: 120,
          child: Card(
            elevation: 2,
            color: Color(0xfff2f2f8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notes.title, style: titleTextStyle),
                  SizedBox(height: 5),
                  Flexible(
                    child: Text(
                      notes.desc,
                      style: descTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    getFormattedDataTime(notes.createdAt.toDate()),
                    style: timeTextStyle,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//InkWell(
//       onTap: press,
//       child: Container(
//         padding: const EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           color: Color(0xfff6f6f6),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Column(
//           children: [
//             Text(
//               notes.title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 19,
//                 color: Colors.black,
//               ),
//             ),
//             Flexible(
//               child: Text(
//                 notes.desc,
//                 maxLines: 5,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black45,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Text(
//               notes.createdAt.toDate().toString(),
//               style: const TextStyle(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 15,
//                 color: Colors.black45,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
