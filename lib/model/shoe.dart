import 'package:flutter/material.dart';

class Shoe with ChangeNotifier{
  final String shoeId;
  final String shoeName;
  final String shoeColor;
  final double shoePrice;
  final String shoeImg;
  final String shoeDesc;

  Shoe({
    required this.shoeId,
    required this.shoeName,
    required this.shoePrice,
    required this.shoeImg,
    required this.shoeColor,
    required this.shoeDesc });
}