import 'dart:convert';

import 'package:http/http.dart' as http;
//import '../models/note_model.dart';
import '../note_model/notes_model.dart';

class NoteAPIService {
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  static Future<bool> syncNote(NoteModel note) async {
    try {
      final res = await http.post(
        Uri.parse(url),
        body: jsonEncode({
          "title": note.title,
          "body": note.body,
          "updatedAt": note.updatedAt
        }),
        headers: {"Content-Type": "application/json"},
      );

      return res.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}