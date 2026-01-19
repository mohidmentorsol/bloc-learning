import 'package:bloc_learning/bloc/slider_bloc/slider_bloc.dart';
import 'package:bloc_learning/bloc/slider_bloc/slider_events.dart';
import 'package:bloc_learning/bloc/slider_bloc/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Switch
            BlocBuilder<SliderBloc, SliderState>(
              buildWhen: (previous, current) => previous.isOn != current.isOn,

              builder: (context, state) {
                print(("BUTTON BUILD"));
                return Switch(
                  value: state.isOn,
                  onChanged: (newValue) {
                    context.read<SliderBloc>().add(const SwitchToggleEvent());
                  },
                );
              },
            ),
            const SizedBox(height: 20),

            // Slider
            BlocBuilder<SliderBloc, SliderState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                print(("SLIDER BUILD"));
                return Slider(
                  value: state.sliderValue,
                  min: 0,
                  max: 1,
                  onChanged: (newValue) {
                    context.read<SliderBloc>().add(
                      SliderUpdateEvent(sliderValue: newValue),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),

            // Red Container 200x200
            BlocBuilder<SliderBloc, SliderState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                print("CONTAINER BUILD");
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: state.sliderValue),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
