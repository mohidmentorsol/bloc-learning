import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/slider_bloc/slider_events.dart';
import 'package:bloc_learning/bloc/slider_bloc/slider_state.dart';

class SliderBloc extends Bloc<SliderEvents, SliderState> {
  SliderBloc() : super(SliderState()) {
    on<SliderUpdateEvent>(_changeSlider);
    on<SwitchToggleEvent>(_isOn);
  }

  void _changeSlider(SliderUpdateEvent event, Emitter<SliderState> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }

  void _isOn(SwitchToggleEvent event, Emitter<SliderState> emit) {
    emit(state.copyWith(isOn: !state.isOn));
  }
}
