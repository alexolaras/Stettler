import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/classes/product.dart';

class Order {
  final DateTime orderDate = DateTime.now();
  final String orderNumber;
  final Client client;
  List<Product> orderedItems;
  bool isFinished;

  Order({
    required this.orderNumber,
    required this.client,
    required this.orderedItems,
    bool? isFinished, 
  }) : isFinished = isFinished ?? false;
}