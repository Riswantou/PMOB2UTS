import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal
import 'package:todo_app/models/task.dart'; // Pastikan Task diimpor jika belum

class TaskDetailPage extends StatelessWidget {
  final Task task;

  TaskDetailPage({required this.task});

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('yyyy-MM-dd'); // Format tanggal
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Name: ${task.name}",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              "Description: ${task.description}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            // Menampilkan dueDate jika tidak null
            Text(
              // ignore: unnecessary_null_comparison
              "Due Date: ${task.dueDate != null ? dateFormat.format(task.dueDate) : 'No Due Date'}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
