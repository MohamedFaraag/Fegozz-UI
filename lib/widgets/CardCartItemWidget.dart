import 'package:cached_network_image/cached_network_image.dart';
import 'package:fegoz/Helper/Colors.dart';
import 'package:fegoz/Helper/constants.dart';
import 'package:fegoz/widgets/HomeWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardCartItem extends StatelessWidget {
  final title, desc;
  final count;
  final id;
  final index;
  final image;
  final price;
  final onPlus, onMinus;
  final onDelet;

  const CardCartItem({
    this.title,
    this.desc,
    this.count,
    this.id,
    this.index,
    this.image,
    this.price,
    this.onPlus,
    this.onMinus,
    this.onDelet,
  });

  @override
  Widget build(BuildContext context) {
    final mSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      closeOnScroll: true,
      secondaryActions: [
        InkWell(
          onTap: onDelet,
          child: CircleAvatar(
            maxRadius: 30.0,
            child: Icon(
              FontAwesomeIcons.trash,
              color: Colors.white,
            ),
          ),
        )
      ],
      child: GestureDetector(
        onTap: () {
          print('ShouldNav');
        },
        child: Container(
          width: mSize.width,
          height: 150,
          padding: EdgeInsets.all(2.0),
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: kBoxShadow01,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Hero(
                    tag: id,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '$title'.toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      '$desc',
                      maxLines: 2,
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 13.0,
                      ),
                    ),
                    CardPrice(
                      price: price,
                      colorImage: kColorPrimaryRGB,
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardPlus(
                    onTap: onPlus,
                    icon: FontAwesomeIcons.plus,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '$count',
                      style: TextStyle(
                        color: theme.hintColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  CardPlus(
                    icon: FontAwesomeIcons.minus,
                    onTap: onMinus,
                  )
                ],
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class CardPlus extends StatelessWidget {
  final icon;
  final onTap;
  CardPlus({this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 20.0,
      height: 20.0,
      child: RawMaterialButton(
        child: Icon(
          icon,
          size: 16,
          color: theme.hintColor,
        ),
        onPressed: onTap,
      ),
    );
  }
}

class CardRowFee extends StatelessWidget {
  final label;
  final title;

  CardRowFee({this.label, this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title',
            style: TextStyle(
              color: theme.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$label',
            style: TextStyle(
                color: theme.accentColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
class CardBottom extends StatelessWidget {
  final onTap;
  final label;
  final color;

  CardBottom({@required this.onTap, @required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/bottom_bar.svg',
              fit: BoxFit.fitWidth,
              color: color ?? theme.primaryColor,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 15,
            child: Center(
              child: Text(
                '$label',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}