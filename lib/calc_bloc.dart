import 'package:bloc/bloc.dart';

import 'calc_events.dart';
import 'calc_state.dart';


class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(InitialState()) {
    on<AddEvent>(_onAddEvent);
    on<SubtractEvent>(_onSubtractEvent);
    on<MultiplyEvent>(_onMultiplyEvent);
    on<DivideEvent>(_onDivideEvent);
  }

  void _onAddEvent(AddEvent event, Emitter<CalculatorState> emit) async {
    emit(LoaderState());
    await Future.delayed(const Duration(seconds: 1));
    int totalSum = event.num1 + event.num2;
    emit(TotalSumState(totalSum));
  }

  void _onSubtractEvent(SubtractEvent event, Emitter<CalculatorState> emit) {
    try {
      if (event.num1 < event.num2) {
        throw Exception("Total Can't be negative");
      }
      int _totalValue = event.num1 - event.num2;
      emit(TotalSumState(_totalValue));
    } catch (e) {
      emit(ErrorState(e.toString()));
      emit(TotalSumState(0));
    }
  }

  void _onMultiplyEvent(MultiplyEvent event, Emitter<CalculatorState> emit) {
    int totalProduct = event.num1 * event.num2;
    emit(TotalSumState(totalProduct));
  }

  void _onDivideEvent(DivideEvent event, Emitter<CalculatorState> emit) {
    try {
      int _totalValue = event.num1 ~/ event.num2;
      emit(TotalSumState(_totalValue));
    } catch (e) {
      emit(ErrorState("Cant Divide By 0"));
      emit(TotalSumState(0));
    }
  }
}