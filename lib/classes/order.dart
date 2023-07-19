import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/classes/product.dart';

class Order {
  final String orderNumber;
  final Client client;
  final List<Product> orderedItems;

  Order({
    required this.orderNumber,
    required this.client,
    required this.orderedItems,
  });
}
