import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:research_alert/core/models/notes_model.dart';
import 'package:research_alert/core/services/database_services.dart';
import 'package:research_alert/core/utils/alert_dialog.dart';
import 'package:research_alert/ui/custom_widgets/list_card.dart';
import 'package:research_alert/ui/screens/notes_detail_screen.dart';
import 'package:research_alert/ui/screens/update_bookmarks_screen.dart';

class BookMarksListData extends StatelessWidget {
  const BookMarksListData();

  @override
  Widget build(BuildContext context) {
    handleOnLongPress(DocumentReference ref) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Delete'),
              content: const Text('Do you want to delete this note?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Text('Cancel', style: TextStyle(color: Colors.red)),
                ),
                TextButton(
                  onPressed: () {
                    DataBaseServices().deleteNote(ref);
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          });
    }

    var currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<QuerySnapshot>(
      stream: DataBaseServices().getAllBookMarksNotes(currentUser!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          showAlertDialog(
              context, "Error", 'Error occurred while loading data');
        } else if (!snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 3.5),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 3.5),
              const Text('No Notes '),
            ],
          );
        }

        //Now the data is received

        List<QueryDocumentSnapshot> notes = snapshot.data!.docs;
        List<Notes> notesList = [];

        for (var note in notes) {
          var notesMap = note.data() as Map<String, dynamic>;

          notesList.add(Notes.fromJson(notesMap));
        }

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
                  onLongPress: () {
                    handleOnLongPress(ref);
                  },
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UpdateBookmarkScreen(
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
