import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:golden_sneaker/constraints/colors.dart';
import 'package:golden_sneaker/model/shoe.dart';
import 'package:golden_sneaker/provider/shoe_provider.dart';
import 'package:golden_sneaker/widget/button_golden.dart';
import 'package:golden_sneaker/widget/cart_item.dart';
import 'package:golden_sneaker/widget/shoe_card.dart';
import 'package:golden_sneaker/widget/text_golden.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class WebBody extends StatefulWidget {
  const WebBody({Key? key}) : super(key: key);

  @override
  _WebBodyState createState() => _WebBodyState();
}

class _WebBodyState extends State<WebBody> {

  Future<void> _getShoes() async {
    await Provider.of<ShoeProvider>(context, listen: false).fetchShoes();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getShoes();
  }


  @override
  Widget build(BuildContext context) {
    final shoeProvider = Provider.of<ShoeProvider>(context);
    final List<Shoe> listShoe = shoeProvider.shoes;


    final cartProvider = Provider.of<CartProvider>(context);


    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 380,
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/nike.png",width: 60,),
                          SizedBox(height: 10,),
                          TextGolden(text: "Our Products", color: ColorsConts.black, size: 24, isBold: true)
                        ],
                      ),
                    ),
                    listShoe.length==0? Center(child: CircularProgressIndicator(),):
                    Expanded(
                      child: Scrollbar(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (c, i){
                              return ChangeNotifierProvider.value(
                                value: listShoe[i],
                                child: ShoeCard(),
                              );
                            }
                            //     ShoeCard(
                            //     shoeName: "Nike Air Zoom Pegasus 36 Shield",
                            //     shoePrice: 89.97,
                            //     shoeImg: "https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/air-zoom-pegasus-36-shield-mens-running-shoe-24FBGb__1_-removebg-preview.png",
                            //     shoeColor: "#4D317F",
                            //     shoeDesc: "The Nike Air Zoom Pegasus 36 Shield gets updated to conquer wet routes. A water-repellent upper combines with an outsole that helps create grip on wet surfaces, letting you run in confidence despite the weather."
                            // )
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              width: 380,
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/nike.png",width: 60,),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextGolden(text: "Your Cart", color: ColorsConts.black, size: 24, isBold: true),
                              TextGolden(text: "\$${cartProvider.getCartItems.isEmpty?0:cartProvider.totalAmount.toStringAsFixed(2)}", color: ColorsConts.black, size: 20, isBold: true),
                            ],
                          )
                        ],
                      ),
                    ),
                    cartProvider.getCartItems.isEmpty?Text("empty cart"):
                    Expanded(
                      child: Scrollbar(
                        child: ListView.builder(
                            itemCount: cartProvider.getCartItems.length,
                            itemBuilder: (c, i) {
                              return ChangeNotifierProvider.value(
                                value: cartProvider.getCartItems.values.toList()[i],
                                child: CardItem(
                                  productId: cartProvider.getCartItems.keys.toList()[i],
                                ),
                              );
                            }
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
