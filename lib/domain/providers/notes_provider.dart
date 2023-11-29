import 'package:flutter/material.dart';
import 'package:notes_app/domain/hive/hive_box.dart';
import 'package:notes_app/domain/hive/notes_data.dart';

class NotesProvider extends ChangeNotifier {
  //controllers
  final titleController = TextEditingController();
  final textController = TextEditingController();

  var box = HiveBox.notes;

  //add notes
  Future<void> addNotes() async {
    await box.add(
      NotesData(
        title:
            titleController.text.isNotEmpty ? titleController.text : 'Заметка',
        text: textController.text.isNotEmpty ? textController.text : 'Описание',
      ),
    ).then((value) => controllerClear());
  }

  Future<void> controllerClear() async{
    titleController.clear();
    textController.clear();
  }


}
