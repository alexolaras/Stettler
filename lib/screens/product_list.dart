import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/data/dummy_products.dart';
import 'package:stettlerproapp/screens/order_details.dart';
import 'package:stettlerproapp/screens/product_details.dart';
import 'package:stettlerproapp/screens/shopping_cart.dart';

import '../classes/order.dart';
import '../classes/product.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/product_data.dart';

class ProductList extends StatefulWidget {
  const ProductList(
      {super.key,
      this.client,
      //this.productList,
      //this.quantityList,
      this.order});

  final Client? client;
  //final List<Product>? productList;
  //final List<int>? quantityList;
  final Order? order;

  @override
  State<ProductList> createState() {
    return _ProductListState();
  }
}

class _ProductListState extends State<ProductList> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> filteredProducts = products;
  final ValueNotifier<int> quantity = ValueNotifier<int>(1);

  void _selectProduct(BuildContext context, String id) {
    final singleProduct = products.firstWhere(((product) => product.id == id));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => widget.order == null
            ? ProductDetails(
                product: singleProduct,
                cartProducts: widget.client?.cartProducts,
                quantity: quantity,
                quantityList: widget.client?.quantityList,
                totalPrice: widget.client?.totalPrice,
              )
            : ProductDetails(
                product: singleProduct,
                cartProducts: widget.order!.orderedItems,
                quantity: quantity,
                quantityList: widget.order!.orderedQuantity,
                totalPrice: ValueNotifier<double>(
                  calculateTotalPrice(widget.order!.orderedQuantity!,
                      widget.order!.orderedItems),
                ),
              ),
      ),
    );
  }

  double calculateTotalPrice(List<int> quantityList, List<Product> orderedItems) {
  double totalPrice = 0;

  for (int i = 0; i < quantityList.length; i++) {
    double price = orderedItems[i].price;
    totalPrice += quantityList[i] * price;
  }

  return totalPrice;
}

  void _searchProduct(String query) {
    final suggestions = products.where((product) {
      final name = product.name.toLowerCase();
      final input = query.toLowerCase();

      return name.contains(input);
    }).toList();

    setState(() => filteredProducts = suggestions);
  }

  void _openCart() {
    if (widget.client != null && widget.order != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => OrderDetails(
            cartItems: widget.order!.orderedItems,
            quantityList: widget.order!.orderedQuantity!,
            totalPrice: ValueNotifier<double>(
              calculateTotalPrice(
                  widget.order!.orderedQuantity!, widget.order!.orderedItems),
            ),
            client: widget.client!,
            order: widget.order!,
          ),
        ),
      );
    } else if (widget.client != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => ShoppingCart(
            cartItems: widget.client!.cartProducts,
            quantityList: widget.client!.quantityList,
            totalPrice: widget.client!.totalPrice,
            client: widget.client!,
          ),
        ),
      );
    } else {
      showNoSelectedClientDialog(context);
    }
  }

  showNoSelectedClientDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Text(
        'Pas de client sélectionné',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            child: Text(
              "Veuillez revenir en arrière et sélectionner un client",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 100, 101, 116),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 44, 213, 111)),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            child: TextButton(
                child: Text("CONFIRMER",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
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
