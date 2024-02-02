import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ToDoList(),
  ));
}

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<String> _toDoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student To-Do List'),
      ),
      body: ListView(children: _getItems()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context),
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTodoItem(String title) {
    setState(() {
      _toDoList.add(title);
    });
    _textFieldController.clear();
  }

  Widget _buildToDoItem(String title) {
    return ListTile(
      title: Text(title),
      trailing: IconButton(
        icon: Icon(Icons.check_box),
        onPressed: () {
          _removeTodoItem(title);
        },
      ),
    );
  }

  void _removeTodoItem(String title) {
    setState(() {
      _toDoList.remove(title);
    });
  }

  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add a task'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Add'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              )
            ],
          );
        });
  }

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _toDoList) {
      _todoWidgets.add(_buildToDoItem(title));
    }
    return _todoWidgets;
  }
}
