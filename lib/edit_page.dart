import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testswfit1/person.dart';
import 'state.dart';

class EditPage extends StatelessWidget {
  final int index;
  final ctrl = TextEditingController();
  EditPage(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<Todo>(context);
    ctrl.text = context.read<Todo>().tasks[index];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: ctrl,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<Todo>().personalEdit(index, ctrl.text as Personal);
                Navigator.pop(context);
              },
              child: const Text("Save")),
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
