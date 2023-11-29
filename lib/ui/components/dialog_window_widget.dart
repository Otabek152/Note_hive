import 'package:flutter/material.dart';
import 'package:notes_app/ui/app_navigator/app_routes.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';

class DialogWindowWidget extends StatelessWidget {
  const DialogWindowWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Title',
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'data',
            style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.textGrey,
            ),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.lightPurpleColor,
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, AppRoutes.changeNotes,
                  arguments: index);
            },
            icon: const Icon(
              Icons.edit,
              color: AppColors.purpleColor,
            ),
            label: Text(
              'Редактировать',
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                color: AppColors.purpleColor,
              ),
            ),
          ),
          DeleteNoteWidget(index: index),
        ],
      ),
    );
  }
}

class DeleteNoteWidget extends StatelessWidget {
  const DeleteNoteWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.lightRedColor,
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.backspace,
        color: AppColors.redColor,
      ),
      label: Text(
        'Удалить',
        style: AppStyle.fontStyle.copyWith(
          fontSize: 16,
          color: AppColors.redColor,
        ),
      ),
    );
  }
}
