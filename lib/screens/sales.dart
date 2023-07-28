import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/widgets/multiple_choice.dart';
import 'package:intl/intl.dart';

import '../widgets/styled_button_small.dart';

class Sales extends StatefulWidget {
  const Sales({super.key, required this.client});

  final Client client;

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOther = GlobalKey<FormState>();
  final _formKeyHours = GlobalKey<FormState>();

  String _registrantSell = '';
  DateTime _purchaseDate = DateTime.now();
  String? _registrantReturn = '';
  DateTime? _returnDate;
  String _discount = '';
  String _discountInvoice = '';
  String _priceCategory = '';
  String _startDeliveryHour = '';
  String _endDeliveryHour = '';
  //List<String> _selectedBillingPeriod = [];
  //List<String> _selectedBillingOther = [];

  @override
  void initState() {
    super.initState();
    _registrantSell = widget.client.purchaseInfo.registrantSell;
    _purchaseDate = widget.client.purchaseInfo.purchaseDate.toUtc();
    _registrantReturn = widget.client.purchaseInfo.registrantReturn;
    _returnDate = widget.client.purchaseInfo.returnDate?.toUtc();
    _discount = widget.client.purchaseInfo.discount;
    _discountInvoice = widget.client.purchaseInfo.discountInvoice;
    _priceCategory = widget.client.purchaseInfo.priceCategory;
    _startDeliveryHour =
        DateFormat.Hm().format(widget.client.purchaseInfo.startDeliveryHour);
    _endDeliveryHour =
        DateFormat.Hm().format(widget.client.purchaseInfo.endDeliveryHour);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Ventes",
        function: CustomAppBarFunction.back,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              height: 50,
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'CLIENT ACQUIS/ANNNULÉ PAR',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
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
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _registrantSell,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Client acquis par",
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
                          _registrantSell = value!;
                        },
                      ),
                      TextFormField(
                        initialValue:
                            DateFormat('dd/MM/yyyy').format(_purchaseDate),
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
                          _purchaseDate = DateTime.parse(value!);
                        },
                      ),
                      TextFormField(
                        initialValue: _registrantReturn,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Client annulé par",
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
                          _registrantReturn = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _returnDate == null ? '' : DateFormat('dd/MM/yyyy').format(_purchaseDate),
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
                          _returnDate = DateTime.parse(value!);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'AUTRE',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
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
                  key: _formKeyOther,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _discount,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Rabais",
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
                          _discount = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _discountInvoice,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Escompte s/bdl (facture)",
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
                          _discountInvoice = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _priceCategory,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Categorie prix",
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
                          _priceCategory = value!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'HEURES LIVRAISON',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
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
                  key: _formKeyHours,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _startDeliveryHour,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Début",
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
                          _startDeliveryHour = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _endDeliveryHour,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Fin",
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
                          _endDeliveryHour = value!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'PÉRIODE FACTURATION',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            MultipleChoice(items: billingPeriod),
            Container(
              height: 50,
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'AUTRES',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            MultipleChoice(items: billingOther),
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
