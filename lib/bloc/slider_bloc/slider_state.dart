import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final double sliderValue;
  final bool isOn;
  const SliderState({this.sliderValue = 0.0, this.isOn = false});

  SliderState copyWith({double? sliderValue, bool? isOn}) {
    return SliderState(
      sliderValue: sliderValue ?? this.sliderValue,
      isOn: isOn ?? this.isOn,
    );
  }

  @override
  List<Object?> get props => [sliderValue, isOn];
}
