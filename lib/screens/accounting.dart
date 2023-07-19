import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/classes/client.dart';

import '../widgets/styled_button_small.dart';

class Accounting extends StatefulWidget {
  const Accounting({super.key, required this.client});

  final Client client;

  @override
  State<Accounting> createState() => _AccountingState();
}

class _AccountingState extends State<Accounting> {
  final _formKeyAccounting = GlobalKey<FormState>();
  String _accountNumber = '';
  String _group = '';
  String _paymentDeadline = '';
  String _representant = '';
  String _language = '';
  String _refunds = '';

  @override
  void initState() {
    super.initState();

    _accountNumber = widget.client.accountingInfo.accountNumber;
    _group = widget.client.accountingInfo.group;
    _paymentDeadline = widget.client.accountingInfo.paymentDeadline;
    _representant = widget.client.accountingInfo.representant;
    _language = widget.client.language;
    _refunds = widget.client.accountingInfo.refunds.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Comptabilité',function: CustomAppBarFunction.back,),
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
                  key: _formKeyAccounting,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _accountNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "N° compte colletif",
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
                          _accountNumber = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _group,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Groupe",
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
                            _group = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _paymentDeadline,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Condition paiement",
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
                            _paymentDeadline = value!;
                        },
                      ),
                      TextFormField(
                         initialValue: _representant,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Représentant",
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
                            _representant = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _language,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Langue",
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
                            _language = value!;
                        },
                      ),
                      TextFormField(
                         initialValue: _refunds,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Ristourne",
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
                            _refunds = value!;
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
