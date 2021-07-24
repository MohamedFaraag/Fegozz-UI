import 'package:fegoz/Helper/DummyData.dart';
import 'package:fegoz/providers/language_provider.dart';
import 'package:fegoz/screens/ChangeAddress.dart';
import 'package:fegoz/widgets/CardCartItemWidget.dart';
import 'package:fegoz/widgets/CardItemDetails.dart';
import 'package:fegoz/widgets/trensations_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'FinishOrder.dart';

class CheckOutScreen extends StatefulWidget {
  static String routeName = '/CheckOut';
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _total = 0;
  double _shipping = 10.0;
  var _addressUser = '560 Elliot Avenue';
  bool _progress = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;

    /// Sum of Product
    DummyData.cartList
        .map((e) {
          return (e.price).toInt() * e.count;
        })
        .toList()
        .fold(0, (p, c) => _total = p + c);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslationText(context, 'tr_dtl'),
          style: TextStyle(color: theme.accentColor),
        ),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _progress,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: mSize.width,
                height: mSize.height,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShakeTransition(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        child: Text(
                          getTranslationText(
                            context,
                            'order_dtl',
                          ),
                          style: TextStyle(
                            color: theme.hintColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < DummyData.cartList.length; i++)
                          ShakeListTransition(
                            duration: Duration(milliseconds: 200 * (i + 1)),
                            axis: Axis.vertical,
                            child: CardItemDetails(
                              title: DummyData.cartList[i].title,
                              count: DummyData.cartList[i].count,
                              image: DummyData.cartList[i].image[0],
                              price: DummyData.cartList[i].price,
                              descrip: DummyData.cartList[i].descrip,
                            ),
                          ),
                      ],
                    ),
                    ShakeTransition(
                      duration: Duration(
                        milliseconds: 1800,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(
                          getTranslationText(context, 'shop_adr'),
                          style: TextStyle(
                            color: theme.hintColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                    ShakeTransition(
                      duration: Duration(
                        milliseconds: 2000,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$_addressUser',
                            style: TextStyle(
                              color: theme.hintColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangeAddress(
                                    newAddress: (value) {
                                      setState(() {
                                        _addressUser = value;
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              getTranslationText(
                                context,
                                'adress_change',
                              ),
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: theme.backgroundColor.withOpacity(0.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    ShakeTransition(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          getTranslationText(context, 'tr_dtl'),
                          style: TextStyle(
                            color: theme.accentColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    ShakeTransition(
                      duration: Duration(milliseconds: 1200),
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
                      duration: Duration(milliseconds: 1600),
                      child: CardRowFee(
                        title: getTranslationText(context, 'total'),
                        label: '\$${_total + _shipping}',
                      ),
                    ),
                    CardBottom(
                      onTap: () {
                        setState(() {
                          _progress = true;
                        });
                        Future.delayed(Duration(seconds: 3), () {
                          Navigator.of(context)
                              .pushNamed(FinishOrder.routeName);
                          setState(() {
                            _progress = false;
                          });
                        });
                      },
                      label: getTranslationText(context, 'buy_now'),
                    ),
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
