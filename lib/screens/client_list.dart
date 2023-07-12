import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/profile.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/widgets/drawer.dart';
import 'package:stettlerproapp/widgets/client_data.dart';
import 'package:stettlerproapp/data/dummy_data.dart';
import '../classes/client.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  final TextEditingController _searchController = TextEditingController();
  List<Client> filteredClients = people;

  void _selectPerson(BuildContext context, String id) {
    final singlePerson = people.where((person) => person.id == id).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => Profile(
          client: singlePerson,
        ),
      ),
    );
  }

  void _searchClient(String query) {
    final suggestions = people.where((client) {
      final name = client.name.toLowerCase();
      final input = query.toLowerCase();

      return name.contains(input);
    }).toList();

    setState(() => filteredClients = suggestions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Liste clients", function: 'drawer'),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            TextField(
                controller: _searchController,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 0,
                      color: Color.fromARGB(150, 124, 125, 129),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(150, 124, 125, 129),
                  ),
                  hintText: 'Nom ou référence client',
                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color.fromARGB(150, 124, 125, 129),
                      fontSize: 14),
                ),
                onChanged: _searchClient),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.all(10),
              child: Text(
                'Liste clients',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: filteredClients.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _selectPerson(
                          context, filteredClients[index].id.toString());
                      _searchController.clear();
                      setState(() {
                        filteredClients = people;
                      });
                    },
                    child: ClientData(
                      id: filteredClients[index].id,
                      name: filteredClients[index].name,
                      surname: filteredClients[index].surname,
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
