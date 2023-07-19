import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';

class NoData extends StatelessWidget {
  final String page;

  const NoData({Key? key, required this.page}) : super(key: key);

  String shownText() {
    if (page == 'sales') {
      return 'Pas de données pour la page de vente';
    }
    if (page == 'discount') {
      return 'Pas de données pour la page de remise';
    }
    if (page == 'delivery') {
      return 'Pas de données pour la page de livraison';
    }
    if (page == 'remarks') {
      return 'Pas de données pour la page des remarques';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: const CustomAppBar(title: 'Ventes', function: CustomAppBarFunction.back),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            shownText(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: const Color.fromARGB(150, 124, 125, 129), fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
