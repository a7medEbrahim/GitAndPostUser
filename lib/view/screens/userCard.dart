import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  int? id;
  String? firstNmae;
  String? lastName;

  UserCard(this.id, this.firstNmae, this.lastName);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("User ID"),
            Text("$id"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("First Name"),
            Text("$firstNmae"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Last Name"),
            Text("$lastName"),
          ],
        ),
      ],
    ));
  }
}
