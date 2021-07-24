import 'package:fegoz/Helper/constants.dart';
import 'package:fegoz/providers/language_provider.dart';
import 'package:fegoz/widgets/CardCartItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeAddress extends StatefulWidget {
  final newAddress;
  ChangeAddress({this.newAddress});
  @override
  _ChangeAddressState createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  var _newAddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Address',
          style: TextStyle(color: theme.accentColor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 15.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getTranslationText(context, 'new_address'),
                    style: TextStyle(color: theme.accentColor),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: kBoxShadow01,
                      color: theme.backgroundColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextFormField(
                      maxLines: null,
                      controller: _newAddressController,
                      style: TextStyle(
                        color: theme.accentColor,
                      ),
                      decoration: InputDecoration(
                        hintText: getTranslationText(context, 'address'),
                        labelText: getTranslationText(context, 'address'),
                        border: InputBorder.none,
                        prefixIcon: Icon(FontAwesomeIcons.userAlt),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CardBottom(
              onTap: () {
                Navigator.of(context).pop();
                widget.newAddress(_newAddressController.text);
              },
              label: 'Save')
        ],
      ),
    );
  }
}
