import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kombe/constants/constants.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function() onTap;

  const CategoryCard({Key? key, required this.title, required this.iconPath, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
         onTap: onTap,
         child: Container(
             height: 100,
             width:130,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(5.0),
               color: Colors.white,
               boxShadow: [
                 BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset.zero,
                      blurRadius: 15.0
                 )
               ]
             ),
             child: Center(
               child: Wrap(
                 direction: Axis.vertical,
                 crossAxisAlignment: WrapCrossAlignment.center,
                 children: [
                   Container(
                        width: 42,
                        height: 42,
                        child: SvgPicture.asset(
                              iconPath,
                              color: primaryColor,
                        ),
                   ),
                   Text(
                        title,
                        style: TextStyle(
                           fontSize: 13.0,
                           height: 1.5,
                        )
                   ),
                 ],
               ),
             ),
         ),
    );
  }
}
