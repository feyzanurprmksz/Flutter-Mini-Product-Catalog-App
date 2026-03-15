import 'product.dart';

class CartModel {
  static final List<Product> _cartItems = [];

  
  static List<Product> get cartItems => List.unmodifiable(_cartItems);

  
  static int get itemCount => _cartItems.length;

  
  static bool isInCart(Product product) {
    return _cartItems.any((item) => item.id == product.id);
  }

  
  static void addToCart(Product product) {
    if (!isInCart(product)) {
      _cartItems.add(product);
    }
  }

  
  static void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.id == product.id);
  }

 
  static void clearCart() {
    _cartItems.clear();
  }

  
  static String getTotalPrice() {
    double total = 0;
    for (var product in _cartItems) {
      String priceStr = product.price.replaceAll('\$', '').replaceAll(',', '');
      total += double.tryParse(priceStr) ?? 0;
    }
    return '\$${total.toStringAsFixed(0)}';
  }
}