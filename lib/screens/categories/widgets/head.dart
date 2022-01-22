import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kombe/data/fake.dart';
import 'package:kombe/models/category.dart';
import 'package:kombe/screens/categories/widgets/action_button.dart';
import 'package:kombe/screens/categories/widgets/filtermodalbottomsheet.dart';
import 'package:kombe/screens/categories/widgets/vertical_separator.dart';
import 'package:kombe/widgets/cart.dart';

class Head extends StatelessWidget {
  final Category category;

  const Head({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: Offset(0.0, 10.0),
          blurRadius: 10.0,
        )
      ]),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: SvgPicture.asset("assets/icons/back.svg"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text(
                  "${category.title}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Container(
                  width: 60.0,
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10.0,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/search.svg",
                        height: 18,
                      ),
                      Cart(numberOfItemsInCart: Fake.numberOfItemsInCart)
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActionButton(
                    title: 'filter',
                    iconPath: 'assets/icons/controls.svg',
                    onTap: () {
                      _settingModalBottomSheet(context);
                    },
                    active: true),
                VerticalSep(),
                ActionButton(
                    title: 'Sort',
                    iconPath: 'assets/icons/sort.svg',
                    onTap: () {},
                    active: false),
                VerticalSep(),
                ActionButton(
                    title: 'List',
                    iconPath: 'assets/icons/list.svg',
                    onTap: () {},
                    active: false),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      context: context,
      builder: (BuildContext bc) {
        return FilterModalBottomSheet();
      });
}
