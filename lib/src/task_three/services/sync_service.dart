//import '../db/database_service.dart';
import '../db/database_services.dart';
//import '../models/note_model.dart';
import '../note_model/notes_model.dart';
//import 'note_api_service.dart';
import 'note_api_services.dart';

class SyncService {
  static Future<void> syncNotes() async {
    final pendingNotes = await DatabaseService.getNotes();

    for (var item in pendingNotes) {
      final note = NoteModel.fromMap(item);

      if (note.isSynced == 0) {
        bool success = await NoteAPIService.syncNote(note);

        if (success) {
          DatabaseService.updateNote(
            note.id!,
            {
              "title": note.title,
              "body": note.body,
              "updatedAt": note.updatedAt,
              "isSynced": 1,
            },
          );
        }
      }
    }
  }
}