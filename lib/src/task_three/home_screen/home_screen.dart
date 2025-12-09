import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaleup/src/task_three/home_screen/widgets/pop_up.dart';
import '../all_provider/dark_provider.dart';
import '../all_provider/note_provider.dart';
import 'crud/edit_screen.dart';

class HomeNotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "ScaleUp Task-3",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
        ),
        actions: [
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
        ],
      ),
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
