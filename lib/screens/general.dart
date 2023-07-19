import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/classes/client.dart';

import '../widgets/styled_button_small.dart';

class General extends StatefulWidget {
  const General({super.key, required this.client});

  final Client client;

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyAddress = GlobalKey<FormState>();
  String _name = '';
  String _surname = '';
  String _addressing = '';
  String _companyName = '';
  String _phoneNumber = '';
  String _email = '';
  String _language = '';
  String _addressNumber = '';
  String _addressStreet = '';
  String _addressAditional = '';
  String _addressPostalCode = '';
  String _addressDoorCode = '';
  String _addressCity = '';
  String _addressStatisticsCode = '';

  @override
  void initState() {
    super.initState();

    _addressing =
        widget.client.gender.toString() == 'male' ? 'Monsieur' : 'Manquer';
    _name = widget.client.name;
    _surname = widget.client.surname;
    _companyName = widget.client.companyName;
    _phoneNumber = widget.client.phoneNumber;
    _email = widget.client.email;
    _language = widget.client.language;
    _addressNumber = widget.client.address.number.toString();
    _addressStreet = widget.client.address.street;
    _addressAditional = widget.client.address.additionalAddress;
    _addressPostalCode = widget.client.address.postalCode;
    _addressDoorCode = widget.client.address.doorCode;
    _addressCity = widget.client.address.city;
    _addressStatisticsCode = widget.client.address.statisticCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Général", function: CustomAppBarFunction.back,),
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
                        initialValue: _addressing,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Politesse",
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
                          _addressing = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _surname,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "NOM Client",
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
                          _name = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _name,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Prénom",
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
                          _name = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _companyName,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Nom enterprise (optionnel)",
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
                          _companyName = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _phoneNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Numéro de téléphone",
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
                          _phoneNumber = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _email,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Email",
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
                          _email = value!;
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
                    ],
                  ),
                ),
              ),
            ),
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
                    "Adresse",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Indiquez l'adresse qui sera mentionnée sur lesfactures. Prenez-soin de l'exactitude des données.",
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
                  key: _formKeyAddress,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: _addressNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Numéro",
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
                          _addressNumber = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _addressStreet,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Rue",
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
                          _addressStreet = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _addressAditional,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Complément adresse",
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
                          _addressAditional = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _addressPostalCode,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Code postal",
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
                          _addressPostalCode = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _addressDoorCode,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Code porte",
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
                          _addressDoorCode = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _addressCity,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Ville",
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
                          _addressCity = value!;
                        },
                      ),
                      TextFormField(
                        initialValue: _addressStatisticsCode,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          labelText: "Ville",
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
                          _addressStatisticsCode = value!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
