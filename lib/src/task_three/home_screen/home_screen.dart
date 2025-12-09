import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../note_provider/note_provider.dart';
//import '../providers/note_provider.dart';
import 'crud/edit_screen.dart';
//import 'note_editor_page.dart';

class HomeNotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Notes (SQLite + Sync)")),
      body: FutureBuilder(
        future: noteProvider.loadNotes(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: noteProvider.notes.length,
            itemBuilder: (_, i) {
              final note = noteProvider.notes[i];
              /*return Card(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

                  title: Text(
                    note.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),

                  subtitle: Text(
                    note.isSynced == 1 ? "Synced ✔" : "Pending ⏳",
                    style: TextStyle(
                      color: note.isSynced == 1 ? Colors.green : Colors.orange,
                    ),
                  ),

                  trailing: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_forever_rounded,
                      size: 30,     // Right side perfect size
                      color: Colors.red,
                    ),
                  ),

                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NoteEditorPage(note: note),
                    ),
                  ),
                ),
              );*/

              return Card(
                child: ListTile(
                  title: Text(
                    note.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(note.isSynced == 1 ? "Synced ✔" : "Pending ⏳"),
                  trailing: SizedBox(
                    height: 25,
                    width: 25,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NoteEditorPage(note: note),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => NoteEditorPage()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
