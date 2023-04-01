// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'person.dart';
// import 'person_state.dart';
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Persons'),
//       ),
//       body: Column(
//         children: [
//           TabBar(
//             onTap: _onTabChanged,
//             tabs: [
//               const Tab(text: 'All'),
//               ...context
//                   .read<PersonProvider>()
//                   .provinces
//                   .map((province) => Tab(text: province))
//                   .toList(),
//             ],
//           ),
//           Expanded(
//             child: Consumer<PersonProvider>(
//               builder: (context, provider, _) {
//                 final persons = _selectedTabIndex == 0
//                     ? provider.persons
//                     : provider.personsByProvince(
//                         context.read<PersonProvider>().provinces[_selectedTabIndex - 1]);
//                 return ListView.builder(
//                   itemCount: persons.length,
//                   itemBuilder: (context, index) {
//                     final person = persons[index];
//                     return ListTile(
//                       title: Text(person.name),
//                       subtitle: Text(person.address),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.delete),
//                         onPressed: () => _onRemoveButtonPressed(person),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _onAddButtonPressed,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
