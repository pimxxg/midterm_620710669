import 'package:flutter/material.dart';

import 'class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bg.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PIG WEIGHT',
                            style: TextStyle(fontSize: 45.0, color: Colors.pink),
                          ),
                          Text(
                            'CALCULATOR',
                            style: TextStyle(fontSize: 45.0, color: Colors.pink),
                          ),
                          Image.asset(
                            'assets/images/pig.png',
                            height: 200.0,
                            alignment: Alignment.center,
                          ),
                          SizedBox(width: 9.0),
                        ],
                      ),
                    ),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300.0,
                    height: 100.0,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _controller1,
                      decoration: InputDecoration(
                        labelText: 'LENGTH(CM)',
                        filled: true,
                        fillColor: Colors.white.withOpacity(1.0),
                        border: OutlineInputBorder(),
                        hintText: 'Enter length',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    width: 300.0,
                    height: 100.0,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _controller2,
                      decoration: InputDecoration(
                        labelText: 'GIRTH(CM)',
                        filled: true,
                        fillColor: Colors.white.withOpacity(1.0),
                        border: OutlineInputBorder(),
                        hintText: 'Enter girth',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 250.0),
                  child: ElevatedButton(
                      child: Text('CALCULATOR',style: TextStyle(fontSize: 15.0, color: Colors.white)),
                      onPressed: () {
                        var input1 = _controller1.text;
                        var input2 = _controller2.text;
                        var length = double.tryParse(input1);
                        var girth = double.tryParse(input2);
                        var pig = Pig(length!,girth!) ;
                        var kg = pig.calWeight ;
                        var pr = pig.calPrice ;


                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('RESULT'),
                                content: Text(
                                    "Weight: $kg Kg\n"
                                "Price: $pr Baht"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'))
                                ],
                              );
                            });


                      }  ),
                )
              ],

            ),
          ),
        ),
      );
  }
}
