import 'package:cached_network_image/cached_network_image.dart';
import 'package:fegoz/Helper/DummyData.dart';
import 'package:fegoz/Helper/constants.dart';
import 'package:fegoz/providers/language_provider.dart';
import 'package:fegoz/screens/varationProductScreen.dart';
import 'package:fegoz/widgets/trensations_widgets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = '/SearchScreen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: theme.accentColor),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 14.0,
            ),
            hintText: getTranslationText(context, 'searchBy'),
            border: InputBorder.none,
            suffixIcon: Icon(
              FontAwesomeIcons.search,
              size: 20.0,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: theme.backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < DummyData.productList.length; i++)
            ShakeListTransition(
              duration: Duration(milliseconds: 200 * (i + 2)),
              axis: Axis.vertical,
              child: CardSearch(
                image: DummyData.productList[i].image[0],
                descrip: DummyData.productList[i].descrip,
                title: DummyData.productList[i].title,
                id: DummyData.productList[i].id,
                price: DummyData.productList[i].price,
              ),
            ),
        ],
      ),
    );
  }
}

class CardSearch extends StatelessWidget {
  final title, descrip;
  final image;
  final price, id;

  CardSearch({this.title, this.descrip, this.image, this.price, this.id});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VarationProdcutScreen(
                    image: image,
                    title: title,
                    descrip: descrip,
                    price: price,
                    id: id,
                  )),
        );
      },
      child: Container(
        width: double.infinity,
        height: 100.0,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          boxShadow: kBoxShadow01,
        ),
        child: Row(
          children: [
            Expanded(
              child: Hero(
                tag: id,
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title',
                      maxLines: 1,
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$descrip',
                      maxLines: 3,
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                      ),
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
