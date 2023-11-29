import 'package:flutter/material.dart';
import 'package:notes_app/ui/app_navigator/app_routes.dart';
import 'package:notes_app/ui/components/notes_body.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 100,
        child: SafeArea(
          child: Column(
            children: [
              Switch(
                value: false,
                onChanged: (value) {},
              ),
              const SizedBox(height: 30),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.language),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: const MenuButton(),
        title: const Text(
          'Заметки',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchNotes);
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 56,
        width: 56,
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.backgroundColor,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(16),
          // ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.addNotes);
          },
          label: const Icon(
            Icons.create_outlined,
            color: AppColors.purpleColor,
          ),
        ),
      ),
      body: const NotesBody(),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(
        Icons.menu,
        color: AppColors.blackColor,
      ),
    );
  }
}
