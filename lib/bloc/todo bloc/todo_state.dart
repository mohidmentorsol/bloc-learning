import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> todoList;

  const TodoState({this.todoList = const []});

  //COPYTWITH METHOD

  TodoState copyWith({List<String>? todoList}) {
    return TodoState(todoList: todoList ?? this.todoList);
  }

  //PROPS

  @override
  List<Object?> get props => [todoList];
}
