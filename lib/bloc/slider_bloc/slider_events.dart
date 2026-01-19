import 'package:equatable/equatable.dart';

abstract class SliderEvents extends Equatable {
  const SliderEvents();

  @override
  List<Object?> get props => [];
}

class SlidersChangedEvents extends SliderEvents {
  final double sliderValue;
  const SlidersChangedEvents({this.sliderValue = 0.0});

  @override
  List<Object?> get props => [sliderValue];
}
