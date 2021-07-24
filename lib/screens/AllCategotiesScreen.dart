import 'dart:io';

import 'package:fegoz/Helper/DummyData.dart';
import 'package:fegoz/widgets/CustomCard.dart';
import 'package:fegoz/widgets/trensations_widgets.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatefulWidget {
  static String routeName = "/allcary";
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('All Categories'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: theme.accentColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: 0.8,
        padding: EdgeInsets.all(10.0),
        children: [
          for (int i = 0; i < DummyData.categoryList.length; i++)
            ShakeListTransition(
              duration: Duration(milliseconds: 400 * (i + 1)),
              child: Customcard(
                title: DummyData.categoryList[i].title,
                image: DummyData.categoryList[i].image,
                id: DummyData.categoryList[i].id,
              ),
            ),
        ],
      ),
    );
  }
}
