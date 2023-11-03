import 'package:flutter/material.dart';

class PickThrow extends StatefulWidget {
  const PickThrow(int numberOfObjects, int highestThrow, {super.key});

  @override
  State<PickThrow> createState() => _PickThrowState();
}

class _PickThrowState extends State<PickThrow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: const Text('Pick a throw')),
            body: SafeArea(
              child: Column(
                children: [
                Container(color: Colors.indigoAccent,
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.40,
                child: Text('above'),),
                Container(color: Colors.lightBlue,
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.40,
                child: Text('blub'),),
                Row(children: [Text('Throws already, State, suggestions pick a ... object pattern with max throw .. on first throw with periode ...')],)
                
                ],),
            )

        
      
    );
  }
}