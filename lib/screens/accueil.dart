import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/widgets/drawer.dart';
import 'package:stettlerproapp/widgets/enterprise_square.dart';

class Accueil extends StatelessWidget {
  const  Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const CustomAppBar(title: "Choix enterprise", function: 'drawer'),
       drawer: const CustomDrawer(),
       body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text("Selectionnez enterprise", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          const SizedBox(height: 10),
          const Text("Completez le profile de votre client en prenant soin de l'exactitude des informations"),
          const SizedBox(height: 30),
          Expanded(
            child: GridView(
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4/3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            children: const[
               //EnterpriseSquare(text: 'AGEMO', color: Colors.red),
               EnterpriseSquare(text: 'STETTLER', color: Colors.yellow),
               //EnterpriseSquare(text: 'DOMIG', color: Colors.blue),
               EnterpriseSquare(text: 'MANOR', color: Colors.orange),
            ]),
          ),
        ],
        
        ),
        
       ),
    );
  }
}
