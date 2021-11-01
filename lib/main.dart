import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dear_feature/dear_feature_cubit.dart';
import 'dear_feature/dear_feature_displayText.dart';
import 'exercise2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(create: (context) =>CounterCubit(),
      child: MyHomePage(title: 'Flutter Demo Home Page',),)
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, int>(builder: (context,count){
              return Column(
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                Text(
                    '$count',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              );
            }),

           
          ],
        ),
      ),
      floatingActionButton: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
        onPressed: ()=> context.read<CounterCubit>().increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),

         Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Exercise2Page()),
            );
              }, child: Text(
               'Exercise 2' 
              ),
              style: ElevatedButton.styleFrom(primary: Colors.lightBlue,
              onPrimary: Colors.purple),
              ),

      ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Exercise2Page extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocProvider(create: (context) => DisplayText(),
      child: Exercise2App(),)
    );
  }

}
