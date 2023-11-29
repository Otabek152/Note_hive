import 'package:flutter/material.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/ui/components/text_form_field_widget.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';
import 'package:provider/provider.dart';

class ChangeNotes extends StatelessWidget {
  const ChangeNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Изменить заметку',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
      ),
      body: const ChangeNotesBody(),
    );
  }
}

class ChangeNotesBody extends StatelessWidget {
  const ChangeNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormFieldWidget(
            labelText: 'Заголовок',
            hintText: 'Заголовок',
            textEditingController: model.titleController,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            labelText: 'Заметки',
            hintText: 'Заметки',
            textEditingController: model.textController,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Изменить',
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.purpleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
