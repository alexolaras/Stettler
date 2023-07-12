import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/product.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Détail produit',
        function: 'back',
        additional: Icons.delete,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: product.length,
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'REF : ${product[index].id}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      const Color.fromARGB(150, 124, 125, 129),
                                  fontSize: 12,
                                ),
                          ),
                          Text(
                            'La boîte', // product[index].price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      const Color.fromARGB(150, 124, 125, 129),
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '${product[index].price.toString()} CHF',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 20),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 73, 139, 240),
                            ),
                            margin: const EdgeInsets.all(5),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 5),
                              alignment: Alignment.center,
                              child: Text(
                                'Stock : 115',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: product[0].id,
                  child: Image.network(
                    product[0].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: Text(
                product[0].ingredients,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color.fromARGB(150, 124, 125, 129),
                      fontSize: 12,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
