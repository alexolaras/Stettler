import 'package:stettlerproapp/classes/product.dart';


enum OrderStatus {

  pending,
  processing,
  sent,
  delivered
}
class Order {
  final DateTime orderDate;
  final String orderNumber;
  final String clientName;
  final String clientSurname;
  final String clientId;
  List<Product> orderedItems;
  List<int>? orderedQuantity;
  final OrderStatus orderStatus;
  final bool isfinished;

  Order({
    DateTime? orderDate,
    required this.orderNumber,
    required this.clientName,
    required this.clientSurname,
    required this.clientId,
    required this.orderedItems,
    this.orderedQuantity,
    required this.orderStatus,
    bool? isfinished,
  })  : orderDate = orderDate ?? DateTime.now(), isfinished = isfinished ?? false;
}