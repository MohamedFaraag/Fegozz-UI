import 'package:fegoz/Helper/DummyData.dart';
import 'package:fegoz/providers/language_provider.dart';
import 'package:fegoz/widgets/HomeWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: TooBarMenu(
              showDrawer: () {
                if (ZoomDrawer.of(context).isOpen()) {
                  ZoomDrawer.of(context).close();
                } else {
                  ZoomDrawer.of(context).open();
                }
              },
            ),
            leading: SizedBox(),
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            toolbarHeight: 70,
            backgroundColor: theme.backgroundColor,
            elevation: 0.1,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: mSize.width,
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 20.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardSearchBag(),
                      SizedBox(height: 20.0),
                      Text(
                        getTranslationText(context, 'new_clothes'),
                        style: TextStyle(
                          color: theme.accentColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 1,
                          letterSpacing: .5,
                        ),
                      ),
                    ]),
              ),
            ]),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.6,
              ),
              delegate: SliverChildListDelegate([
                for (int i = 0; i < DummyData.productList.length; i++)
                  CardItem(
                    title: DummyData.productList[i].title,
                    image: DummyData.productList[i].image[0],
                    price: DummyData.productList[i].price,
                    descrip: DummyData.productList[i].descrip,
                    id: DummyData.productList[i].id,
                  ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
