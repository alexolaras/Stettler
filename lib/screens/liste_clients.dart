import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/profil.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/widgets/drawer.dart';
import 'package:stettlerproapp/widgets/client_data.dart';
import 'package:stettlerproapp/data/dummy_data.dart';

class ListeClients extends StatefulWidget {
  const ListeClients({super.key});

  @override
  State<ListeClients> createState() => _ListeClientsState();
}

class _ListeClientsState extends State<ListeClients> {
  final TextEditingController _searchController = TextEditingController();
  var _inputText = '';

  void _selectPerson(BuildContext context, String id) {
    final singlePerson = people.where((person) => person.id == id).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Profil(
          client: singlePerson,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Liste clients"),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              style: Theme.of(context).textTheme.bodyMedium,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Nom ou référence client',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(250, 231, 231, 231), width: 0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _selectPerson(context, people[index].id.toString());
                    },
                    child: ClientData(
                      id: people[index].id,
                      name: people[index].name,
                      surname: people[index].surname,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
