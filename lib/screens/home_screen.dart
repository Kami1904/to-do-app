// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:todo/screens/create_todo_screen.dart';
// import 'package:todo/screens/edit_screen.dart';
//
//
// import '../core/entities/todo_entitty.dart';
// import '../core/utils/app_colors.dart';
// import '../widgets/todo_card_widget.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<HomeScreen> {
//   final List<TodoEntity> listTodo = [];
//
//   @override
//   void initState() {
//     _generateSampleTodos();
//     super.initState();
//   }
//
//   void _generateSampleTodos() {
//     final random = Random();
//     for (int i = 1; i <= 10; i++) {
//       listTodo.add(
//         TodoEntity(
//           title: 'Todo Task $i',
//           description: 'Description for Todo Task $i',
//           createdAt:
//               DateTime.now().subtract(Duration(days: random.nextInt(10))),
//           isDone: random.nextBool(),
//           id: DateTime.now().millisecondsSinceEpoch,
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.accent,
//         title: Text("TODO APP 543            "),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => CreateTodoScreen(
//                     onSave: (TodoEntity entity) {
//                       listTodo.insert(0, entity);
//                       setState(() {});
//                     },
//                   ),
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: ListView.separated(
//           itemCount: listTodo.length,
//           padding: EdgeInsets.all(10.r),
//           separatorBuilder: (context, index) => SizedBox(height: 15.h),
//           itemBuilder: (context, index) {
//             final todo = listTodo[index];
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EditScreen(onSave: onSave, todo: )),
//                 );
//               },
//                 child: TodoCardWidget(entity: todo));
//           },
//         ),
//       ),
//     );
//   }
// }
