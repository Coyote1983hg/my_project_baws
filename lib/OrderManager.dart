import 'Order.dart';
import 'domain/ShoppingCart.dart';
import 'Customer.dart';
import 'InventoryManager.dart';
import 'domain/ClothingItem.dart';
// Order Manager class
class OrderManager {
  final List<Order> _orders = [];

  void placeOrder(ShoppingCart cart, Customer customer) {
    final order = _createOrder(cart, customer);
    _orders.add(order);
    _updateInventory(cart.items);
  }

  List<Order> getOrders() {
    return _orders;
  }

  Order _createOrder(ShoppingCart cart, Customer customer) {
    final orderId = _generateOrderId();
    return Order(
      id: orderId,
      items: cart.items,
      customer: customer,
      total: cart.total,
    );
  }

  String _generateOrderId() {
    return 'ORDER-${DateTime.now().millisecondsSinceEpoch}';
  }

  void _updateInventory(List<ClothingItem> items) {
    final inventoryManager = InventoryManager();
    for (final item in items) {
      inventoryManager.updateItemQuantity(item.id, item.quantity);
    }
  }
}
