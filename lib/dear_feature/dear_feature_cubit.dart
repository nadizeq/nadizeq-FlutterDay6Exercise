import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit <int>{
  CounterCubit() : super (0);

  //state is int //emit = display
  void increment ()=> emit (state + 1);
}