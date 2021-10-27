import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

import '../../constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: EdgeInsets.only(top: getProportionateScreenWidth(10),left: getProportionateScreenWidth(10),right: getProportionateScreenWidth(10)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Qidiruv...",
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(11)),
          ),
        ),
      ),
    );
  }
}
