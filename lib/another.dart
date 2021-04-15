import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {

  final String input;
  const AnotherPage({Key key, this.input}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(), 
        title: Text("Your Location"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 200 
          ),
          child: Center(
            child: Text(
              "Here is a map of: ${input}"
            ),
          ),
        )
      )
    );
  }
}