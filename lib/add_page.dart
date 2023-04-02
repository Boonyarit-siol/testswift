import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';
import 'main.dart';
import 'person.dart';

class AddPage extends StatelessWidget {
  final name = TextEditingController();
  final lastName = TextEditingController();
  final age = TextEditingController();
  final phoneNumber = TextEditingController();
  final province = TextEditingController();
  final ctrl = TextEditingController();
  AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<Todo>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: TextField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: TextField(
              controller: lastName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter lastName',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: TextField(
              controller: province,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Province',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: TextField(
              controller: phoneNumber,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter PhoneNumber',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                todo.personalAdd(Personal(
                    name: name.text,
                    lastName: lastName.text,
                    age: age.text,
                    phoneNumber: phoneNumber.text,
                    province: province.text));
                Navigator.pop(context);
              },
              child: const Text("Add Member")),
        ],
      ),
    );
  }
}
