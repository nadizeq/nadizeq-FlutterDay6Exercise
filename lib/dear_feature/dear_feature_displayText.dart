import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayText extends Cubit <String>{

  DisplayText() : super ('');

  void textInput (String text)=> emit (text);
}