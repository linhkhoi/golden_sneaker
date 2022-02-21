import 'package:flutter/material.dart';
import 'package:golden_sneaker/utils/string_to_color.dart';
import 'package:golden_sneaker/widget/text_golden.dart';
import 'package:provider/provider.dart';

import '../constraints/colors.dart';
import '../model/shoe.dart';
import '../provider/cart_provider.dart';
import 'button_golden.dart';

class ShoeCard extends StatefulWidget {
  const ShoeCard({Key? key}) : super(key: key);

  @override
  _ShoeCardState createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final shoeAttribute = Provider.of<Shoe>(context);
    return Container(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 30),
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: StringToColor.getColorFromHex(shoeAttribute.shoeColor)
            ),
            child: RotationTransition(
                turns: AlwaysStoppedAnimation(-25 / 360),
                child: Image.network(shoeAttribute.shoeImg)
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextGolden(text: shoeAttribute.shoeName, color: ColorsConts.black, size: 20, isBold: true),
          SizedBox(
            height: 20,
          ),
          TextGolden(text: shoeAttribute.shoeDesc,
              color: ColorsConts.grey, size: 14, isBold: false),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextGolden(text: "\$${shoeAttribute.shoePrice}", color: ColorsConts.black, size: 20, isBold: true),
              ButtonGolden(isIcon: false,
                  text: cartProvider.getCartItems.containsKey(shoeAttribute.shoeId)?"In Cart":"ADD TO CART", size: 18,
                  color: ColorsConts.black,
                  backgroundColor: ColorsConts.Yellow,
                  borderColor: ColorsConts.Yellow,
                  onPress: (){
                    cartProvider.getCartItems.containsKey(shoeAttribute.shoeId)? (){} :
                    cartProvider.addProductToCart(shoeAttribute.shoeId,
                        shoeAttribute.shoeName,
                        shoeAttribute.shoePrice,
                        shoeAttribute.shoeImg,
                        shoeAttribute.shoeColor);

                  })

            ],
          ),
          SizedBox(
              height: 50),
        ],
      ),
    );
  }
}

