import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Todo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _tasks = [];

  // Function to add task
  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text);
        _controller.clear();
      });
    }
  }

  // Function to remove task
  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200], // สีพื้นหลังของ Sidebar
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // สีของหัวข้อ Sidebar
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/images/cat.jpg'), // เปลี่ยนเป็นรูปภาพของคุณ
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome, User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Tasks'),
              onTap: () {
                Navigator.pop(context); // ปิด Sidebar
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // ปิด Sidebar
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white, // สีพื้นหลังของหน้าจอหลัก
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // TextField for inputting task
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter Task',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Button to add task
              ElevatedButton(
                onPressed: _addTask,
                child: const Text('Add Task'),
              ),
              const SizedBox(height: 16),
              // Display list of tasks
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(_tasks[index]),
                      onDismissed: (direction) {
                        // Remove the task when swiped
                        _removeTask(index);
                      },
                      background: Container(color: Colors.red),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/cat.jpg', // ไอคอนของแต่ละงาน
                          width: 40,
                          height: 40,
                        ),
                        title: Text(_tasks[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _removeTask(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
