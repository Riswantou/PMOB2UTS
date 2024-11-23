import 'package:flutter/material.dart';
import 'add_task.dart'; // Halaman untuk menambahkan tugas
import 'task_detail.dart'; // Halaman untuk melihat detail tugas
import 'package:todo_app/models/task.dart'; // Model Task untuk menggunakan DateTime
import 'package:intl/intl.dart' as intl; // Menggunakan alias untuk DateFormat

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];

  // Fungsi untuk menambahkan task
  void _addTask(String taskName, String taskDescription, DateTime taskDueDate) {
    setState(() {
      tasks.add(Task(
        name: taskName,
        description: taskDescription,
        dueDate: taskDueDate, // Menyimpan tanggal sebagai DateTime
      ));
    });
  }

  // Fungsi untuk membuka halaman AddTask
  void _openAddTaskPage(BuildContext context) async {
    final taskData = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskPage(),
      ),
    );

    if (taskData != null) {
      String taskName = taskData['name'];
      String taskDescription = taskData['description'];
      DateTime taskDueDate = taskData['dueDate'];

      _addTask(taskName, taskDescription, taskDueDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    var dateFormat = intl.DateFormat(
        'yyyy-MM-dd'); // Menambahkan format tanggal yang diinginkan

    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: tasks.isEmpty
            ? Center(
                child: Text("No tasks added yet!",
                    style: TextStyle(fontSize: 20, color: Colors.white)))
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.blueGrey[800], // Warna latar belakang kartu
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        tasks[index].name,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      subtitle: Text(
                        '${tasks[index].description}\nDue: ${dateFormat.format(tasks[index].dueDate)}', // Menampilkan tanggal dengan format
                        style: TextStyle(color: Colors.white70),
                      ),
                      onTap: () {
                        // Navigasi ke halaman detail tugas
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TaskDetailPage(task: tasks[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddTaskPage(context),
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
