import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/data/dummy_products.dart';
import 'package:stettlerproapp/screens/product_details.dart';
import 'package:stettlerproapp/screens/shopping_cart.dart';

import '../classes/order.dart';
import '../classes/product.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/product_data.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, this.client});

  final Client? client;


  @override
  State<ProductList> createState() {
    return _ProductListState();
  }
}

class _ProductListState extends State<ProductList> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> filteredProducts = products;
  List<Product> cartProducts = [];
  final ValueNotifier<int> quantity = ValueNotifier<int>(1);
  List<int> quantityList = [];
  final ValueNotifier<double> totalPrice = ValueNotifier<double>(0);


  void _selectProduct(BuildContext context, String id) {
    final singleProduct =
        products.where((product) => product.id == id).toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ProductDetails(
          product: singleProduct,
          cartProducts: cartProducts,
          quantity: quantity,
          quantityList: quantityList,
          totalPrice: totalPrice,
        ),
      ),
    );
  }

  void _searchProduct(String query) {
    final suggestions = products.where((product) {
      final name = product.name.toLowerCase();
      final input = query.toLowerCase();

      return name.contains(input);
    }).toList();

    setState(() => filteredProducts = suggestions);
  }

  void _openCart(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ShoppingCart(
          cartItems: cartProducts,
          quantityList: quantityList,
          totalPrice: totalPrice,
          client: widget.client,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Liste produits",
        function: CustomAppBarFunction.back,
        additionalIcon: Icons.shopping_bag_outlined,
        additionalFunction: () => _openCart(),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  hintText: 'Glace enfant',
                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color.fromARGB(150, 124, 125, 129),
                      fontSize: 14),
                ),
                onChanged: _searchProduct),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _selectProduct(
                          context, filteredProducts[index].id.toString());
                      _searchController.clear();
                      setState(() {
                        filteredProducts = products;
                      });
                    },
                    child: ProductData(
                      image: filteredProducts[index].image,
                      id: filteredProducts[index].id,
                      name: filteredProducts[index].name,
                      price: filteredProducts[index].price,
                      ingredients: filteredProducts[index].ingredients,
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
