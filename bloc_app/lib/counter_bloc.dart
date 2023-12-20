// ignore_for_file: unnecessary_set_literal

import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterStateInitial()) {
    on<CounterEventIncrease>((event, emit) {
      emit(CounterStateIncrease(state.value + event.increaseValue));
      //? state.value += event.increaseValue;
    });

    on<CounterEventDecrease>((event, emit) {
      emit(CounterStateDecrease(state.value - event.decreaseValue));
    });
  }
}

//! Event
abstract class CounterEvent {}

class CounterEventIncrease extends CounterEvent {
  int increaseValue;
  CounterEventIncrease(this.increaseValue);
}

class CounterEventDecrease extends CounterEvent {
  int decreaseValue;
  CounterEventDecrease(this.decreaseValue);
}

//! State
abstract class CounterState {
  int value = 0;
}

class CounterStateInitial extends CounterState {}

class CounterStateIncrease extends CounterState {
  CounterStateIncrease(int a) {
    value = a;
  }
}

class CounterStateDecrease extends CounterState {
  CounterStateDecrease(int a) {
    value = a;
  }
}
