import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';
import 'main.dart';
import 'person.dart';

class AddPage extends StatelessWidget {
  final ctrl = TextEditingController();
  AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<Todo>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: ctrl,
          ),
          ElevatedButton(
              onPressed: () {
                todo.personalAdd(Personal(
                    name: ctrl.text,
                    lastName: ctrl.text,
                    age: ctrl.text,
                    phoneNumber: ctrl.text,
                    province: ctrl.text));
                Navigator.pop(context);
              },
              child: const Text("Add Member")),
        ],
      ),
    );
  }
}
