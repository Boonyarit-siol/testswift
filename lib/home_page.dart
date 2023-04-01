import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';
import 'add_page.dart';
import 'edit_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tasks = context.watch<Todo>().tasks;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(tasks[index]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => EditPage(index)));
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
