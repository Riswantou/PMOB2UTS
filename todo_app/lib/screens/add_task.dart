import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? dueDate;

  // Format tanggal
  var dateFormat = DateFormat('yyyy-MM-dd');

  // Fungsi untuk memilih tanggal tenggat waktu
  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != dueDate) {
      setState(() {
        dueDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input untuk nama tugas
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Task Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Input untuk deskripsi tugas
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "Task Description",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Pilih tanggal tenggat waktu
            GestureDetector(
              onTap: () => _selectDueDate(context),
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: dueDate == null
                        ? "Select Due Date"
                        : dateFormat
                            .format(dueDate!), // Menampilkan tanggal format
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Tombol untuk menyimpan tugas
            ElevatedButton(
              onPressed: () {
                String taskName = nameController.text;
                String taskDescription = descriptionController.text;
                if (taskName.isEmpty ||
                    taskDescription.isEmpty ||
                    dueDate == null) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Error"),
                      content: Text("Please fill in all fields."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Kirim data tugas kembali ke halaman sebelumnya
                  Navigator.pop(
                    context,
                    {
                      'name': taskName,
                      'description': taskDescription,
                      'dueDate': dueDate, // Kirim sebagai DateTime
                    },
                  );
                }
              },
              child: Text("Save Task"),
            ),
          ],
        ),
      ),
    );
  }
}
