import 'package:fegoz/Helper/DummyData.dart';
import 'package:fegoz/widgets/HomeWidgets.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectedCatyScreen extends StatefulWidget {
  final title;
  SelectedCatyScreen({this.title});

  @override
  _SelectedCatyScreenState createState() => _SelectedCatyScreenState();
}

class _SelectedCatyScreenState extends State<SelectedCatyScreen> {
  bool _isGrid = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.title}',
          style: TextStyle(color: theme.accentColor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(!_isGrid
                ? FontAwesomeIcons.gripVertical
                : FontAwesomeIcons.alignJustify),
            onPressed: () {
              if (mounted)
                setState(() {
                  _isGrid = !_isGrid;
                });
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _isGrid ? 2 : 1,
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
