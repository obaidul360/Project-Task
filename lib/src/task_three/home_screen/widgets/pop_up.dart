import 'package:flutter/material.dart';

import '../../db/database_services.dart';

void confirmDelete(BuildContext context, int id) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Delete Note?"),
        content: Text("Are you sure you want to delete this note?"),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // popup close
            },
            child: Text("Cancel"),
          ),

          TextButton(
            onPressed: () async {
              await DatabaseService.deleteNote(id);
              Navigator.pop(context); // popup close

              // UI refresh করতে setState বা Provider notify দরকার
              //(context as Element).markNeedsBuild();
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}

