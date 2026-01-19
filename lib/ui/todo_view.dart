import 'package:bloc_learning/bloc/todo%20bloc/todo_bloc.dart';
import 'package:bloc_learning/bloc/todo%20bloc/todo_events.dart';
import 'package:bloc_learning/bloc/todo%20bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo')),

      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) => state.todoList.isEmpty
            ? Center(child: Text("No Todos Yet"))
            : ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.todoList[index]),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<TodoBloc>().add(
                        RemoveTodo(task: state.todoList[index]),
                      );
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (var n = 1; n <= 10; n++) {
            context.read<TodoBloc>().add(AddTodoEvent(task: 'Todo $n'));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
