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

  String refreshText = '';

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
            Center(
              child: Text('Click at the text field, enter text and click green tick button or enter key. Then click floating button to display text',
              style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),),
            ),
            Padding(padding: EdgeInsets.all(10)),
            
            BlocBuilder<DisplayText, String>(
              builder: (context, state) {
                return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: myController,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      onEditingComplete: (){
                        context.read<DisplayText>().textInput(myController.text.toString());

                        FocusScope.of(context).unfocus();
                      },
                      
                    ),
                  );
              },
            ),
      
      
            BlocBuilder<DisplayText, String>(builder: (context,text){
              return FloatingActionButton(
                onPressed: () {
                  
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('$text'.toUpperCase()),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 15
                      ),
                    ),
                    child: Text('CLOSE'),
                    onPressed: (){                     
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                      context.read<DisplayText>().textInput(refreshText);
                    },
                  ),
                ],
              );
            },
          );
        },
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