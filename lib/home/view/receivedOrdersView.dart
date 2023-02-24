import 'package:flutter/material.dart';

class ReceivedOrdersView extends StatelessWidget {
  const ReceivedOrdersView({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        SafeArea(
          child: Center(child: Container(
            child: Text("Students Orders"),
          )),
        ),
    );
  }
}