// import 'package:bloc/bloc.dart';
// import 'package:bloc_learning/bloc/counter%20bloc/counter_events.dart';
// import 'package:bloc_learning/bloc/counter%20bloc/counter_state.dart';

// class CounterBloc extends Bloc<CounterEvents, CounterState> {
//   CounterBloc() : super(CounterState()) {
//     on<Increment>(_onIncrement);
//     on<Decrement>(_onDecrement);
//   }

//   void _onIncrement(Increment event, Emitter<CounterState> emit) {
//     emit(state.copyWith(counter: state.counter + 1));
//   }

//   void _onDecrement(Decrement event, Emitter<CounterState> emit) {
//     emit(state.copyWith(counter: state.counter - 1));
//   }
// }
