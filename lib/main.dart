import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';
import 'package:bloc_start/home.dart';
import'calc_bloc.dart';
import 'calc_events.dart';
import 'calc_state.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

// Calculator Widget
class Calculator extends StatelessWidget {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider<CalculatorBloc>(
            create: (context) => CalculatorBloc(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocListener<CalculatorBloc, CalculatorState>(
                  listener: (context, state) {
                    if (state is ErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)));
                    }
                  },
                  child: BlocBuilder<CalculatorBloc, CalculatorState>(
                    builder: (context, state) {
                      log("State : $state");
                      dynamic _total = 0;
                      if (state is LoaderState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is TotalSumState) {
                        _total = state.totalSum;
                        return Column(
                          children: [
                            Text(
                              "Total: $_total",
                              style: TextStyle(fontSize: 40),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _num1Controller,
                              decoration: InputDecoration(hintText: "Num 1"),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _num2Controller,
                              decoration: InputDecoration(hintText: "Num 2"),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<CalculatorBloc>().add(AddEvent(
                                    int.parse(_num1Controller.text),
                                    int.parse(_num2Controller.text)));
                              },
                              child: Text("Add"),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<CalculatorBloc>().add(
                                    SubtractEvent(
                                        int.parse(_num1Controller.text),
                                        int.parse(_num2Controller.text)));
                              },
                              child: Text("Subtract"),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<CalculatorBloc>().add(
                                    MultiplyEvent(
                                        int.parse(_num1Controller.text),
                                        int.parse(_num2Controller.text)));
                              },
                              child: Text("Multiply"),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<CalculatorBloc>().add(DivideEvent(
                                    int.parse(_num1Controller.text),
                                    int.parse(_num2Controller.text)));
                              },
                              child: Text("Divide"),
                            ),
                          ],
                        );
                      } else if (state is InitialState) {
                        context.read<CalculatorBloc>().add(AddEvent(0, 0));
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
