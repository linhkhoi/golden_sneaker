import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golden_sneaker/model/shoe.dart';

class ShoeProvider with ChangeNotifier{
 List _shoes = [];
 List<Shoe> get shoes {
   return [..._shoes];
 }
 Future<void> fetchShoes() async{
   final String response = await rootBundle.loadString('assets/data/shoes.json');
   final data = await json.decode(response);
   List dataShoes = data["shoes"];
   for( var i = 0 ; i < dataShoes.length; i++) {
     _shoes.add(
       Shoe(
           shoeId: dataShoes[i]["id"].toString(),
           shoeName: dataShoes[i]["name"],
           shoePrice: dataShoes[i]["price"],
           shoeImg: dataShoes[i]["image"],
           shoeColor: dataShoes[i]["color"],
           shoeDesc: dataShoes[i]["description"])
     );
   }
 }

 List getShoe(){
   fetchShoes();
   return _shoes;
 }

 Shoe getById(int id){
   return _shoes.firstWhere((element) => element.shoeId == id);
 }
}