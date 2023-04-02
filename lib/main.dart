import 'package:flutter/material.dart';
import 'package:testswfit1/add_page.dart';
import 'package:provider/provider.dart';

import 'edit_page.dart';
import 'state.dart';
import 'person.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Todo(),
      child: const MaterialApp(
        title: _title,
        home: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<Todo>(context);
    List<Personal> personalListFilter = List<Personal>.from(todo.personalList);
    personalListFilter.sort((a, b) => a.province.compareTo(b.province));

    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Widget'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.people),
            ),
            Tab(
              icon: Icon(Icons.info),
            ),
            Tab(
              icon: Icon(Icons.abc_sharp),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView.builder(
            itemCount: personalListFilter.length,
            itemBuilder: (BuildContext context, int index) {
              final Personal personal = personalListFilter[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index == 0)
                    Container(
                      height: 30,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      color: Colors.grey,
                      alignment: Alignment.centerLeft,
                      child: Text(personal.province.toUpperCase()),
                    )
                  else if (personalListFilter[index].province.toUpperCase() !=
                      personalListFilter[index - 1].province.toUpperCase())
                    Container(
                      height: 30,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      color: Colors.grey,
                      alignment: Alignment.centerLeft,
                      child: Text(personal.province.toUpperCase()),
                    ),
                  ListTile(
                    leading: CircleAvatar(
                        child: Text(personal.name[0].toUpperCase())),
                    title: Text('${personal.name} ${personal.lastName}'),
                    subtitle: Text(
                        'Age: ${personal.age}, Phone: ${personal.phoneNumber} Province: ${personal.province}'),
                  ),
                ],
              );
            },
          ),
          const Center(
            child: Text('Info Tab'),
          ),
          const Center(
            child: Text('ABC Tab'),
          ),
        ],
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
