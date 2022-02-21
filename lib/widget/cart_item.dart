import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:golden_sneaker/utils/string_to_color.dart';
import 'package:golden_sneaker/widget/text_golden.dart';
import 'package:provider/provider.dart';

import '../constraints/colors.dart';
import '../model/cart_attr.dart';
import '../provider/cart_provider.dart';
import 'button_golden.dart';

class CardItem extends StatefulWidget {
  final String productId;

  CardItem({required this.productId});

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {


    final cartAttr = Provider.of<CartAttr>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Container(
      width: 200,
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: StringToColor.getColorFromHex(cartAttr.shoeColor)
                  ),
                  width: 80,
                  height: 80,
                ),
                Positioned(
                  bottom: -10,
                  right: -5,
                  left: -18,
                  child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-25 / 360),
                      child: Image.network(cartAttr.shoeImg,width: 100,)),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextGolden(text: cartAttr.shoeName, color: ColorsConts.black, size: 15, isBold: true),
                SizedBox(height: 10,),
                TextGolden(text: "\$${cartAttr.shoePrice}", color: ColorsConts.black, size: 20, isBold: true),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          cartAttr.quantity < 2 ? cartProvider.removeItem(widget.productId)
                              : cartProvider.reduceItemByOne(widget.productId);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                        child: Icon(FontAwesome.minus, size: 14,)
                    ),

                    TextGolden(text: cartAttr.quantity.toString(), color: ColorsConts.black, size: 15, isBold: false),
                    ElevatedButton(
                        onPressed: (){
                          cartProvider.addProductToCart(widget.productId, cartAttr.shoeName, cartAttr.shoePrice, cartAttr.shoeImg, cartAttr.shoeColor);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                        child: Icon(FontAwesome.plus, size: 14,)
                    ),
                    Expanded(
                      child:
                      ElevatedButton(
                          onPressed: (){
                            cartProvider.removeItem(widget.productId);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                          child: Icon(FontAwesome.trash, size: 14,)
                      )

                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

