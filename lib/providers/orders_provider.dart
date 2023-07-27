import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/order.dart';

class OrdersNotifier extends StateNotifier<List<Order>> {
  OrdersNotifier() : super([]);

  void setOrders(List<Order> orders){
    state = orders;
  }

  void addOrder(Order order) {
    state = [...state, order];
  }
}

final ordersProvider =
    StateNotifierProvider<OrdersNotifier, List<Order>>((ref) {
  return OrdersNotifier();
});
