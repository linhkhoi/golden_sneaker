import 'package:flutter/material.dart';

import '../model/cart_attr.dart';

class CartProvider with ChangeNotifier{
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

  double get totalAmount{
    var total = 0.0;
    _cartItems.forEach((key, value) {total += value.shoePrice*value.quantity;});
    return total;
  }

  void addProductToCart(String id, String title, double price, String imageUrl, String color){
    if(_cartItems.containsKey(id)){
      _cartItems.update(id, (exitingCartItem) => CartAttr(
          id: exitingCartItem.id,
          shoeId: exitingCartItem.shoeId,
          shoeName: exitingCartItem.shoeName,
          quantity: exitingCartItem.quantity+1,
          shoePrice: exitingCartItem.shoePrice,
          shoeImg: exitingCartItem.shoeImg,
          shoeColor: exitingCartItem.shoeColor
      )
      );
    } else {
      _cartItems.putIfAbsent(id, () => CartAttr(
          id: DateTime.now().toString(),
          shoeName: title,
          shoeId: id,
          quantity: 1,
          shoePrice: price,
          shoeImg: imageUrl,
          shoeColor: color
      )
      );
    }
    notifyListeners();
  }

  void reduceItemByOne(String id){
    if(_cartItems.containsKey(id)){
      _cartItems.update(id, (exitingCartItem) => CartAttr(
          id: exitingCartItem.id,
          shoeId: exitingCartItem.shoeId,
          shoeName: exitingCartItem.shoeName,
          quantity: exitingCartItem.quantity-1,
          shoePrice: exitingCartItem.shoePrice,
          shoeImg: exitingCartItem.shoeImg,
          shoeColor: exitingCartItem.shoeColor
      )
      );
    }
    notifyListeners();
  }

  void removeItem(String productId){
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart(){
    _cartItems.clear();
    notifyListeners();
  }
}