import 'package:flutter/material.dart';
import 'package:shop_app/models/country.dart';
import 'package:shop_app/size_config.dart';

import 'flag_widget.dart';

class CountryListTileWidget extends StatelessWidget {
  final Country country;
  final bool isSelected;
  final GestureTapCallback press;

  const CountryListTileWidget({
    Key key,
    @required this.country,
    //  @required this.isNative,
    @required this.isSelected,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme
        .of(context)
        .primaryColor;
    final style = isSelected
        ? TextStyle(
      fontSize: 18,
      color: selectedColor,
      fontWeight: FontWeight.bold,
    )
        : TextStyle(fontSize: 18);

    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(left:getProportionateScreenWidth(8),right: getProportionateScreenWidth(8)),
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: FlagWidget(code: country.code),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       country.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        country.capital,
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
