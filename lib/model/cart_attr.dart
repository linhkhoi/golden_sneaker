

import 'package:flutter/material.dart';

class CartAttr with ChangeNotifier{
  final String id;
  final String shoeId;
  final String shoeName;
  final String shoeColor;
  final double shoePrice;
  final String shoeImg;
  final int quantity;

  CartAttr({
    required this.id,
    required this.shoeId,
    required this.shoeName,
    required this.shoePrice,
    required this.shoeImg,
    required this.shoeColor,
    required this.quantity });
}