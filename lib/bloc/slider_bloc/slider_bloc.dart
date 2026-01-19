import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/slider_bloc/slider_events.dart';
import 'package:bloc_learning/bloc/slider_bloc/slider_state.dart';

class SliderBloc extends Bloc<SliderEvents, SliderState> {
  SliderBloc() : super(SliderState()) {
    on<SlidersChangedEvents>(_changeSlider);
  }

  void _changeSlider(SlidersChangedEvents event, Emitter<SliderState> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}
