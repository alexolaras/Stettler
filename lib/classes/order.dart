import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/classes/product.dart';

class Order {
  final DateTime orderDate;
  final String orderNumber;
  final String clientName;
  final String clientSurname;
  final String clientId;
  List<Product> orderedItems;
  bool isFinished;

  Order({
    DateTime? orderDate,
    required this.orderNumber,
    required this.clientName,
    required this.clientSurname,
    required this.clientId,
    required this.orderedItems,
    bool? isFinished,
  })  : orderDate = orderDate ?? DateTime.now(),
        isFinished = isFinished ?? false;
}