import 'package:flutter/material.dart';
import 'package:todoapps/todoadd_page.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoAppPage(),
    );
  }
}

class TodoAppPage extends StatefulWidget {
  const TodoAppPage({super.key});

  @override
  State<TodoAppPage> createState() => _TodoAppPageState();
}

class _TodoAppPageState extends State<TodoAppPage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('リスト一覧'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: Colors.green,
            ),
            key: ValueKey<String>(todoList[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                todoList.removeAt(index);
              });
            },
            child: Card(
              child: ListTile(
                title: Text(todoList[index]),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
          if (newListText != null) {
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
