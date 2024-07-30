abstract class CalculatorEvent {}

class AddEvent extends CalculatorEvent {
  int num1;
  int num2;

  AddEvent(this.num1, this.num2);
}

class SubtractEvent extends CalculatorEvent {
  int num1;
  int num2;

  SubtractEvent(this.num1, this.num2);
}

class MultiplyEvent extends CalculatorEvent {
  int num1;
  int num2;

  MultiplyEvent(this.num1, this.num2);
}

class DivideEvent extends CalculatorEvent {
  int num1;
  int num2;

  DivideEvent(this.num1, this.num2);
}
