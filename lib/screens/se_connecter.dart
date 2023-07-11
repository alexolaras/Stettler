import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/Accueil.dart';
import 'package:stettlerproapp/widgets/styled_button.dart';

class SeConnecter extends StatefulWidget {
  const SeConnecter({super.key});

  @override
  State<SeConnecter> createState() => _SeConnecterState();
}

class _SeConnecterState extends State<SeConnecter> {
  final _formKey = GlobalKey<FormState>();
  var _enteredId = '';
  var _enteredPassword = '';

  void _submit() {
    /*final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }*/

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Accueil(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 170,
                child: Image.asset('lib/assets/images/logo.png'),
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('lib/assets/images/workers.png'),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 40),
                    child: Text("Connexion",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              labelText: "Votre identifiant AGIO",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          150, 124, 125, 129),
                                      fontSize: 14),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Vous n'avez pas saisi d'identifiant valide";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredId = value!;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              labelText: "Mot de passe",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          150, 124, 125, 129),
                                      fontSize: 14),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  value.length < 6) {
                                return "Saisissez un mot de passe d'au moins 6 caractères";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              StyledButton(
                text: "CONNEXION",
                onPressed: _submit,
                color: const Color.fromARGB(255, 229, 36, 36),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
