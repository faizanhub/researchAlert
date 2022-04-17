import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:research_alert/core/models/notes_model.dart';
import 'package:research_alert/core/services/database_services.dart';
import 'package:research_alert/core/utils/alert_dialog.dart';
import 'package:research_alert/ui/custom_widgets/list_card.dart';
import 'package:research_alert/ui/screens/notes_detail_screen.dart';

class Listdata extends StatelessWidget {
  const Listdata();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: DataBaseServices().getAllNotes(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          showAlertDialog(
              context, "Error", 'Error occurred while loading data');
        } else if (!snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('No Notes '),
            ],
          );
        }

        //Now the data is received

        List<QueryDocumentSnapshot> notes = snapshot.data!.docs;
        List<Notes> notesList = [];

        notes.forEach((note) {
          var notesMap = note.data() as Map<String, dynamic>;

          notesList.add(Notes.fromJson(notesMap));
        });

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                var ref = snapshot.data!.docs[index].reference;

                return ListCard(
                  notes: notesList[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NotesDetailScreen(
                          notes: notesList[index],
                          ref: ref,
                        ),
                      ),
                    );
                  },
                );
              }),
        );
      },
    );
  }
}
