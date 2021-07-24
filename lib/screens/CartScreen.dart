import 'dart:math';
import 'package:fegoz/Helper/DummyData.dart';
import 'package:fegoz/providers/language_provider.dart';
import 'package:fegoz/screens/CheckOutScreen.dart';
import 'package:fegoz/widgets/CardCartItemWidget.dart';
import 'package:fegoz/widgets/trensations_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  static String routeName = '/CartScreen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _total = 0;
  double _shipping = 10.0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;

    /// sum per product
    DummyData.cartList
        .map((e) {
          return (e.price).toInt() * e.count;
        })
        .toList()
        .fold(0, (p, c) => _total = p + c);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslationText(context, 'myCart'),
          style: TextStyle(color: theme.accentColor),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: mSize.height,
            width: mSize.width,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShakeTransition(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: Text(
                      getTranslationText(context, 'selected'),
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Flexible(
                    child: ListView(
                  padding: EdgeInsets.only(bottom: mSize.height / 3),
                  children: [
                    for (int i = 0; i < DummyData.cartList.length; i++)
                      ShakeListTransition(
                        duration: Duration(
                          milliseconds: 400 * (i + 1),
                        ),
                        axis: Axis.vertical,
                        child: CardCartItem(
                          id: DummyData.cartList[i].id,
                          price: DummyData.cartList[i].price,
                          title: DummyData.cartList[i].title,
                          image: DummyData.cartList[i].image[0],
                          count: DummyData.cartList[i].count,
                          desc: DummyData.cartList[i].descrip,
                          onPlus: () {
                            var _listCart = DummyData.cartList[i];
                            _listCart.count = max(1, _listCart.count + 1);
                          },
                          onMinus: () {
                            var _listCart = DummyData.cartList[i];
                            if (_listCart.count == 0) {
                              return false;
                            }
                            _listCart.count = max(1, _listCart.count - 1);
                          },
                          onDelet: () {
                            setState(() {
                              DummyData.cartList.removeAt(i);
                            });
                          },
                        ),
                      ),
                  ],
                ))
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: theme.backgroundColor.withOpacity(0.8),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  ShakeTransition(
                    child: CardRowFee(
                      title: getTranslationText(context, 'deliveryFee'),
                      label: '\$$_shipping',
                    ),
                  ),
                  Divider(
                    color: theme.unselectedWidgetColor,
                    height: 20.0,
                    indent: 30.0,
                    endIndent: 30.0,
                  ),
                  ShakeTransition(
                    duration: Duration(milliseconds: 1200),
                    child: CardRowFee(
                      title: getTranslationText(context, 'total'),
                      label: '\$${_total + _shipping}',
                    ),
                  ),
                  CardBottom(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(CheckOutScreen.routeName);
                      },
                      label: getTranslationText(context, 'checkout')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
