import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity, // Ensure the card takes full width
      height: 100, // Specify the desired height
      child: Card(
        color: Colors.white,
        borderOnForeground: true,
        elevation: 10,
        child: ListTile(
          leading: Icon(Icons.call),
          title: Text("sccasc", style: TextStyle(color: Colors.green)),
          subtitle: Text(
            'dfsfs',
            style: TextStyle(color: Colors.orangeAccent),
          ),
        ),
      ),
    );
  }
}
