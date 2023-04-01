import 'package:flutter/material.dart';
import 'package:testswfit1/add_page.dart';
import 'add_page.dart';
import 'package:provider/provider.dart';
import 'edit_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<Personal> personalList = [
    Personal(
        name: "A",
        lastName: "AA",
        age: "20",
        phoneNumber: "0999999",
        province: "SG"),
    Personal(
        name: "B",
        lastName: "BB",
        age: "20",
        phoneNumber: "0999999",
        province: "ST"),
    Personal(
        name: "C",
        lastName: "CC",
        age: "20",
        phoneNumber: "0999999",
        province: "SK"),
  ];
  @override
  Widget build(BuildContext context) {
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
            itemCount: personalList.length,
            itemBuilder: (BuildContext context, int index) {
              final Personal personal = personalList[index];
              return ListTile(
                leading: CircleAvatar(child: Text(personal.name[0])),
                title: Text('${personal.name} ${personal.lastName}'),
                subtitle: Text(
                    'Age: ${personal.age}, Phone: ${personal.phoneNumber} Province: ${personal.province}'),
              );
            },
          ),
          Center(child: Text('Tab 2')),
          Center(child: Text('Tab 3')),
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

class Personal {
  String name;
  String lastName;
  String age;
  String phoneNumber;

  String province;

  Personal({
    required this.name,
    required this.lastName,
    required this.age,
    required this.phoneNumber,
    required this.province,
  });
}
