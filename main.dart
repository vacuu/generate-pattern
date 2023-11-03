import 'package:flutter/material.dart';
import 'package:siteswap_generator_above_below/pick_throw_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Generate Siteswap'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int numberOfObjects = 3;
  int highestThrow = 5;
  List<SimpleDialogOption> highestThrowList = [];


void changeNumberOfObjects(int i) {
  setState(() {

  numberOfObjects = i;
    
  });

}


void changeHighestThrow(int i) {
  setState(() {

  highestThrow = i;
    
  });

}

showAlertDialogChooseHighestThrow(BuildContext context) {

  List<SimpleDialogOption> myOptions = [];

  // from 3 to 10
  for(int i=numberOfObjects+1;i<=numberOfObjects+5;i++){
    myOptions.add(SimpleDialogOption(
    child: Card(
      margin: EdgeInsets.zero,
      child: ListTile(title: Center(child: Text('$i')))),
    onPressed: () {
      // print('$i clicked');
      Navigator.of(context).pop(i);
    },));
  }


  // set up the SimpleDialog
  SimpleDialog dialog = SimpleDialog(
    title: const Text('Select highest Throw'),
    children: myOptions,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  ).then((value) {
  if(value == null) {
    
  } else {
  changeHighestThrow(value);
  }
  }
  );
}

showAlertDialogChooseNumber(BuildContext context) {

  List<SimpleDialogOption> myOptions = [];

  // from 3 to 10
  for(int i=3;i<=10;i++){
    myOptions.add(SimpleDialogOption(
    child: Card(
      margin: EdgeInsets.zero,
      child: ListTile(title: Center(child: Text('$i')))),
    onPressed: () {
      // print('$i clicked');
      Navigator.of(context).pop(i);
    },));
  }


  // set up the SimpleDialog
  SimpleDialog dialog = SimpleDialog(
    title: const Text('Select number of objects'),
    children: myOptions,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  ).then((value) {
    if (value == null){

    } else {
  changeNumberOfObjects(value);
  }
  }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 200,),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [const Text('mumber of objects'), const SizedBox(width: 20), OutlinedButton(onPressed: () async {
                showAlertDialogChooseNumber(context);
                
              }, child: Text('$numberOfObjects'),), ],),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [const Text('highest throw'), const SizedBox(width: 20), OutlinedButton(onPressed: () async {
                showAlertDialogChooseHighestThrow(context);
              }, child: Text('$highestThrow'),), ],),

            const SizedBox(height: 32,),
            ElevatedButton(onPressed: (){
              if(highestThrow <= numberOfObjects) {
                showDialog(context: context, builder: (BuildContext context) {
                  return SimpleDialog(title: const Text('highest throw is to low'),
                  
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: const Text('okay'))
                  ],);
                });} else {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => PickThrow(numberOfObjects, highestThrow)),);
                }
              }
            , child: const Text('START JUGGLING')),
          ],
        ),
      )
      
      /*  Center(child: ListTile(
                title: Text("Test"),
                trailing: Icon(Icons.fitness_center),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Test"),
                        content: StatefulBuilder(
             builder: (BuildContext context, StateSetter setState) {
                return  Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: checkBoxValueTheraband,
                                  onChanged: (value) {
                                    setState(() { 
                                   checkBoxValueTheraband = value as bool;
                                    //  exerciseChooser();
                                    });
                                  },
                                ),
                                Text("Theraband"),

                              ]),

                            ]);

                   }
                        ));});
  }))*/
  );
  }
}

