import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/counter_cubit.dart';
import 'package:statemanagement/multiply_page.dart';
import 'divide_page.dart';
import 'counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: BlocProvider (               //created before create a BLoC
          create: (context) => CounterCubit(),     //this class is from the counter_cubit page
          child: const MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {     //stateful means it will change, so u need to set the state on hw is it going to run
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {     //rmb to use setState()
  int count = 0;

  late CounterCubit cubit;

  @override
  void didChangeDependencies() {                        // this runs whenever the state changes
    cubit = BlocProvider.of<CounterCubit>(context);
    super.didChangeDependencies();
  }

  final List<String> userinput = <String>[];

  TextEditingController userinputController = TextEditingController();

  void addUserInput(){
    setState(() {
      userinput.insert(0,userinputController.text);
    });
  }

  void printUserInput (BuildContext context) {
    if(userinputController.text.isEmpty) {
      print('Please enter a valid number!');
    } else {
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter BloC Demo')),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20),
          child: TextField(
            style: TextStyle(),
            controller: userinputController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              labelText: 'Please input your number',
            ),
          ),),
          BlocConsumer<CounterCubit, int> (                                    //combination of both listener and builder
            bloc: cubit,
            listener: (context, state) {
              const snackbar = SnackBar(content: Text('State has changed using BlocConsumer.'),);
              const snackbarforreset = SnackBar(content: Text('State reset.'),);

              if( state == 5) {
               ScaffoldMessenger.of(context).showSnackBar(snackbar);                //if wanna add snackbar, just use if else
              }
              else if (state == 0) {
                ScaffoldMessenger.of(context).showSnackBar(snackbarforreset);
              }
            },

            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('$state', style: const TextStyle(fontSize: 50)),
                    ElevatedButton(
                        onPressed: () {
                          cubit.increment();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                        ),
                        child: const Text('Increment', style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 5),
                        )),
                    ElevatedButton(
                        onPressed: () {
                      cubit.decrement();
                    },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                        ),
                        child: const Text('Decrement', style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 5)
                        )),
                    ElevatedButton(
                        onPressed: () {
                      cubit.reset();
                    },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                        ),
                        child: const Text('Reset', style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 5,
                    )
                    )
                    ),
                    ElevatedButton(
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return multiplyPage((context));
                          }))
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                        ),
                        child: const Text('Multiply', style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 5,
                        )
                        )
                    ),

                    ElevatedButton(
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return dividePage();
                          }))
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                        ),
                        child: const Text('Divide', style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 5,
                        )
                        )
                    ),
                  ],
                ),
              );
            },

            // child: BlocListener<CounterCubit, int >(              //after blocbuilder is created
            //   bloc: cubit,
            //   listener: (context, state) {
            //     const snackbar = SnackBar(content: Text('State has reached'),
            //     );
            //     if(state == 5) {
            //       ScaffoldMessenger.of(context).showSnackBar(snackbar);
            //     }
            //   },
            //   child: BlocBuilder<CounterCubit, int>(
            //     bloc: cubit,                                    //give after the blocbuilder created
            //     builder: (context, state) {
            //       return Center(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: <Widget>[
            //             Text('$state'),
            //             ElevatedButton(
            //               onPressed: () {
            //             cubit.increment();
            //             },
            //                 child: const Text('Increment'),
            //             )
            //           ],
            //         ),
            //       );
            //     }
            //   ),
            // ),
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     cubit.increment();
      //   },
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

