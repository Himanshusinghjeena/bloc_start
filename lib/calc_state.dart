abstract class CalculatorState {}

class TotalSumState extends CalculatorState {
  int totalSum;

  TotalSumState(this.totalSum);
}

class ErrorState extends CalculatorState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class LoaderState extends CalculatorState {}

class InitialState extends CalculatorState {}
