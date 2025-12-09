import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleup/src/task_three/home_screen/widgets/pop_up.dart';
import '../db/database_services.dart';
import '../note_provider/note_provider.dart';
import 'crud/edit_screen.dart';

class HomeNotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    void confirmDelete(BuildContext context, int id) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Delete Note?"),
            content: Text("Are you sure you want to delete this note?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  await DatabaseService.deleteNote(id);
                  await noteProvider.loadNotes(); // ✅ UI automatically refresh
                  Navigator.pop(context);
                },
                child: Text("Delete", style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Notes (SQLite + Sync)")),
      body: FutureBuilder(
        future: noteProvider.loadNotes(),
        builder: (context, snapshot) {
          if (noteProvider.notes.isEmpty) {
            return Center(child: Text("No notes found"));
          }
          return ListView.builder(
            itemCount: noteProvider.notes.length,
            itemBuilder: (_, i) {
              final note = noteProvider.notes[i];
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
                      icon: Icon(
                        Icons.delete_forever_rounded,
                        size: 28,
                        color: Colors.red,
                      ),
                      onPressed: () => confirmDelete(context, note.id!),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NoteEditorPage(note: note),
                      ),
                    );
                  },
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

/*class HomeNotePage extends StatefulWidget {
  @override
  State<HomeNotePage> createState() => _HomeNotePageState();
}

class _HomeNotePageState extends State<HomeNotePage> {

  @override
  Widget build(BuildContext context) {
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
    // Provider acces
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
              */ /*return Card(
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
              );*/ /*

              */ /*return Card(
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
              );*/ /*
              return Card(
                child: ListTile(
                  title: Text(
                    note.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(note.isSynced == 1 ? "Synced ✔" : "Pending ⏳"),

                  // ⬅ DELETE BUTTON (perfect size + no error)
                  trailing: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(Icons.delete_forever_rounded, size: 28, color: Colors.red),
                    onPressed: () => confirmDelete(context, note.id),
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NoteEditorPage(note: note),
                      ),
                    );
                  },
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
}*/
