import 'package:flutter/material.dart';

class CardItemDetails extends StatelessWidget {
  final image;
  final title, descrip;
  final count;
  final price;

  CardItemDetails(
      {this.image, this.title, this.descrip, this.count, this.price});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 70.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Image(
              image: NetworkImage(image),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title'.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theme.accentColor,
                  ),
                ),
                Text(
                  '$descrip',
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.0,
                    color: theme.accentColor,
                  ),
                ),
                Text(
                  '\$${price * count}',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: theme.hintColor),
                ),
              ],
            ),
          ),
          Text(
            '$count Item',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12.0,
                color: theme.hintColor),
          ),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
