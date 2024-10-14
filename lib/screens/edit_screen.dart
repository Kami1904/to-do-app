import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/entities/todo_entitty.dart';
import '../core/utils/app_colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_form_field_widget.dart';

class EditScreen extends StatefulWidget {
  final Function(TodoEntity entity) onSave;
  final TodoEntity todo;

  const EditScreen({super.key, required this.onSave, required this.todo});

  @override
  State<EditScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditScreen> {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerTitle.text = widget.todo.title;
    controllerDescription.text = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.accent,
          title: const Text("Edit To-do"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                TextFormFieldWidget(
                  controller: controllerTitle,
                  hintText: "Title",
                ),
                SizedBox(height: 10.h),
                TextFormFieldWidget(
                  controller: controllerDescription,
                  hintText: "Description",
                ),
                SizedBox(height: 50.h),
                ButtonWidget(
                    onTap: () {
                      final todo = widget.todo.copyWith(
                        title: controllerTitle.text,
                        description: controllerDescription.text,
                      );

                      widget.onSave.call(todo);
                      Navigator.pop(context);

                  },
                  title: "Save",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
