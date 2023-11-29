import 'package:flutter/material.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/ui/components/text_form_field_widget.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';
import 'package:provider/provider.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Добавить заметку',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
      ),
      body: const AddNotesBody(),
    );
  }
}

class AddNotesBody extends StatelessWidget {
  const AddNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          TextFormFieldWidget(
            labelText: 'Заголовок',
            hintText: 'Заголовок',
            textEditingController: model.titleController,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            labelText: 'Заметка',
            hintText: 'Заметка',
            textEditingController: model.textController,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                model.addNotes();
                Navigator.pop(context);
              },
              child: const Text('Добавить'),
            ),
          ),
        ],
      ),
    );
  }
}
