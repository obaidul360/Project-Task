import 'package:flutter/material.dart';
//import '../db/database_service.dart';
import '../db/database_services.dart';
//import '../models/note_model.dart';
import '../note_model/notes_model.dart';
import '../services/sync_service.dart';

class NoteProvider with ChangeNotifier {
  List<NoteModel> notes = [];

  Future<void> loadNotes() async {
    final data = await DatabaseService.getNotes();
    notes = data.map((e) => NoteModel.fromMap(e)).toList();
    notifyListeners();
  }

  Future<void> addNote(String title, String body) async {
    await DatabaseService.createNote({
      "title": title,
      "body": body,
      "updatedAt": DateTime.now().toIso8601String(),
      "isSynced": 0
    });

    await loadNotes();
    SyncService.syncNotes(); // try sync
  }

  Future<void> updateNote(NoteModel note, String t, String b) async {
    await DatabaseService.updateNote(
      note.id!,
      {
        "title": t,
        "body": b,
        "updatedAt": DateTime.now().toIso8601String(),
        "isSynced": 0,
      },
    );

    await loadNotes();
    SyncService.syncNotes();
  }

  Future<void> deleteNote(int id) async {
    await DatabaseService.deleteNote(id);
    await loadNotes();
  }
}