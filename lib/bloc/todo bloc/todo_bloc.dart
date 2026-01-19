import 'package:bloc_learning/bloc/todo%20bloc/todo_events.dart';
import 'package:bloc_learning/bloc/todo%20bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  final List<String> todoList = [];
  TodoBloc() : super(TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodo>(_removeTodo);
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _removeTodo(RemoveTodo event, Emitter<TodoState> emit) {
    print(todoList.toString());
    todoList.remove(event.task);
    print(todoList.toString());
    emit(state.copyWith(todoList: List.from(todoList)));
    print(todoList.toString());
  }
}
