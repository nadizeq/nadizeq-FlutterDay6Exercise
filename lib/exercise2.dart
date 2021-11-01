import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dear_feature/dear_feature_displayText.dart';

class Exercise2App extends StatefulWidget{
  @override
  Exercise2State createState() => Exercise2State();
}

class Exercise2State extends State <Exercise2App>{

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(title: Center(child: Text('Exercise 2'),),),
      
      body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.teal.shade300,
                  Colors.blue.shade700,
                ],
              )
          ),
          child: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      
      
            BlocBuilder<DisplayText, String>(builder: (context,text){
              return FloatingActionButton(
                onPressed: () {
                  context.read<DisplayText>().textInput(myController.text.toString());
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('$text'.toUpperCase()),
              );
            },
          );
        },
        
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
              );
            }),

           
          ],
        ),
      ),
      ),
      );
  }
}