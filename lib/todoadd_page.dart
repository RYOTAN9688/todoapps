import 'package:flutter/material.dart';

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Todo'),
        ),
        body: Container(
          padding: EdgeInsets.all(64),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextField(
              onChanged: (value) => {
                setState(() {
                  _text = value;
                }),
              },
              decoration: InputDecoration(
                labelText: 'Todo',
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text);
                },
                child: Text(
                  'リストを追加',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text);
                },
                child: Text(
                  'キャンセル',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ]),
        ));
  }
}
