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
            // Switch (UI only)
            Switch(value: false, onChanged: (_) {}),

            const SizedBox(height: 20),

            // Slider (UI only)
            BlocBuilder<SliderBloc, SliderState>(
              builder: (context, state) {
                return Slider(
                  value: state.sliderValue,
                  min: 0,
                  max: 1,
                  onChanged: (newValue) {
                    context.read<SliderBloc>().add(
                      SlidersChangedEvents(sliderValue: newValue),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),

            // Red Container 200x200
            BlocBuilder<SliderBloc, SliderState>(
              builder: (context, state) {
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(state.sliderValue),
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
