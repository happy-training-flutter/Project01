import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/note_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatelessWidget {
  final box = Hive.box<NoteModel>('notesBox');

  final titleController = TextEditingController();
  final descController = TextEditingController();

  void addNote() {
    final note = NoteModel(
      title: titleController.text,
      description: descController.text,
      createdAt: DateTime.now(),
    );
    box.add(note);
    titleController.clear();
    descController.clear();
  }

  void deleteNote(int index) {
    box.deleteAt(index);
  }

  void editNote(int index) {
    NoteModel? note = box.getAt(index);
    titleController.text = note!.title;
    descController.text = note.description;
    box.deleteAt(index);
  }

  String formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final min = time.minute.toString().padLeft(2, '0');
    return "$hour:$min";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hive Notes')),

      body: Column(
        children: [

          // 📝 Input fields
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addNote,
                  child: Text('Add Note'),
                ),
              ],
            ),
          ),

          // 📋 Notes List
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box<NoteModel> box, _) {
                if (box.isEmpty) {
                  return Center(child: Text("No Notes"));
                }

                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final note = box.getAt(index);

                    return ListTile(
                      title: Text(note!.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(note.description),
                          Text(
                            "${note.createdAt.day}-${note.createdAt.month}-${note.createdAt.year} ${formatTime(note.createdAt)}",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteNote(index),
                      ),
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => editNote(index),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}