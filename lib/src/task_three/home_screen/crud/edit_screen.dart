import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../all_provider/note_provider.dart';
import '../../note_model/notes_model.dart';


class NoteEditorPage extends StatefulWidget {
  final NoteModel? note;
  NoteEditorPage({this.note});
  @override
  _NoteEditorPageState createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  final titleC = TextEditingController();
  final bodyC = TextEditingController();
  @override
  void initState() {
    if (widget.note != null) {
      titleC.text = widget.note!.title;
      bodyC.text = widget.note!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NoteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? "Add Note" : "Edit Note"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleC,
              decoration: InputDecoration(hintText: "Title"),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TextField(
                controller: bodyC,
                maxLines: null,
                decoration: InputDecoration(hintText: "Body"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.note == null) {
                  provider.addNote(titleC.text, bodyC.text);
                } else {
                  provider.updateNote(widget.note!, titleC.text, bodyC.text);
                }
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
