import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {
  const TodoEvents();

  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoEvents {
  final String task;

  const AddTodoEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemoveTodo extends TodoEvents {
  final Object task;

  const RemoveTodo({required this.task});

  @override
  List<Object?> get props => [task];
}
