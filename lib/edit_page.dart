import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testswfit1/person.dart';
import 'state.dart';

class EditPage extends StatelessWidget {
  final int index;
  final name = TextEditingController();
  final lastName = TextEditingController();
  final age = TextEditingController();
  final phoneNumber = TextEditingController();
  final province = TextEditingController();
  final ctrl = TextEditingController();

  EditPage(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<Todo>(context);
    ctrl.text = context.read<Todo>().personalList[index] as String;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: ctrl,
          ),
          ElevatedButton(
              onPressed: () {
                todo.personalEdit(
                    index,
                    Personal(
                        name: name.text,
                        lastName: lastName.text,
                        age: age.text,
                        phoneNumber: phoneNumber.text,
                        province: province.text));
                Navigator.pop(context);
              },
              child: const Text("Edit")),
          ElevatedButton(
              onPressed: () {
                context.read<Todo>().personalDelete(index);
                Navigator.pop(context);
              },
              child: const Text("Delete")),
        ],
      ),
    );
  }
}
