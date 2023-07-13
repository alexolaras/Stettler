import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/classes/client.dart';

import '../widgets/styled_button_small.dart';

class Tours extends StatefulWidget {
  const Tours({super.key, required this.client});

  final Client client;

  @override
  State<Tours> createState() => _ToursState();
}

class _ToursState extends State<Tours> {
  final _formKeyTours = GlobalKey<FormState>();

  String _transportationNumber = '';
  String _transportationCode = '';
  DateTime _transportationDate = DateTime.now();
  String _transportationSEQ = '';
  String _sellerCode = '';


  @override
  void initState() {
    super.initState();
    _transportationNumber = widget.client.purchaseInfo!.transportation.transportationNumber;
    _transportationCode = widget.client.purchaseInfo!.transportation.transportationCode;
    _transportationDate = widget.client.purchaseInfo!.transportation.transportationDate.toUtc();
    _transportationSEQ = widget.client.purchaseInfo!.transportation.transportationSEQ;
    _sellerCode = widget.client.purchaseInfo!.transportation.sellerCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Tournées', function: 'back', additionalIcon: Icons.add_circle,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Information de compte",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Complétez le profil de votre client en prenant soinde l'exactitude des informations.",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKeyTours,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                         initialValue: _transportationNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Tournées",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      const Color.fromARGB(150, 124, 125, 129),
                                  fontSize: 14),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Remplissez tous les champs obligatoires";
                          }
                          return null;
                        },
                        onSaved: (value) {
                            _transportationNumber = value!;
                        },
                      ),
                      TextFormField(
                         initialValue: _transportationCode,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Code",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      const Color.fromARGB(150, 124, 125, 129),
                                  fontSize: 14),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Remplissez tous les champs obligatoires";
                          }
                          return null;
                        },
                        onSaved: (value) {
                            _transportationCode = value!;
                        },
                      ),
                      TextFormField(
                         initialValue: _transportationDate.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Date",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      const Color.fromARGB(150, 124, 125, 129),
                                  fontSize: 14),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Remplissez tous les champs obligatoires";
                          }
                          return null;
                        },
                        onSaved: (value) {
                            _transportationDate = DateTime.parse(value!);
                        },
                      ),
                      TextFormField(
                         initialValue: _transportationSEQ,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "SÉQ",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      const Color.fromARGB(150, 124, 125, 129),
                                  fontSize: 14),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Remplissez tous les champs obligatoires";
                          }
                          return null;
                        },
                        onSaved: (value) {
                            _transportationSEQ = value!;
                        },
                      ),
                      TextFormField(
                         initialValue: _sellerCode,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Code vendeur",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      const Color.fromARGB(150, 124, 125, 129),
                                  fontSize: 14),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Remplissez tous les champs obligatoires";
                          }
                          return null;
                        },
                        onSaved: (value) {
                            _sellerCode = value!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: StyledButtonSmall(
                  text: "SAUVEGARDER",
                  onPressed: () {},
                  color: Colors.blue[600]!),
            )
          ],
        ),
      ),
    );
  }
}
