import 'package:equatable/equatable.dart';

abstract class SliderEvents extends Equatable {
  const SliderEvents();

  @override
  List<Object?> get props => [];
}

class SliderUpdateEvent extends SliderEvents {
  final double sliderValue;
  const SliderUpdateEvent({required this.sliderValue});

  @override
  List<Object?> get props => [sliderValue];
}

class SwitchToggleEvent extends SliderEvents {
  const SwitchToggleEvent();
}
