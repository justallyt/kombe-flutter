import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kombe/constants/constants.dart';

// ignore: must_be_immutable
class PromoCard extends StatelessWidget {
  static final List<Color> bgColors = [primaryColor, primaryPromoColor];
  final String title;
  final String subtitle;
  final String? caption;
  final String? tag;
  final String? imagePath;
  final String backgroundImagePath;
  final bool reverseGradient;

  const PromoCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.backgroundImagePath,
    this.tag,
    this.caption,
    this.imagePath,
    required this.reverseGradient,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width:260,
      height:160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset.zero,
                blurRadius: 15.0
            )
        ],
       gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // ignore: unnecessary_null_comparison
            colors: reverseGradient != null && reverseGradient
                    ? bgColors.reversed.toList()
                    : bgColors
       ),
       image: DecorationImage(
           image: AssetImage(this.backgroundImagePath),
           fit: BoxFit.cover,
       )
      ),
      child: Stack(
           children: [
             if(this.imagePath != null)
                Positioned(
                  right:0,
                  bottom:16.0,
                  child: Image.asset(
                      this.imagePath.toString()
                  ),
                ),
            Wrap(
                 direction: Axis.vertical,
                 children: [
                     Text(
                         this.title,
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 14.0,
                             height:1.1
                         ),
                     ),
                     Text(
                         this.subtitle,
                         style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            height: 1.5,
                         ),
                     )
                 ],
            ),
            Positioned(
                left: 0,
                bottom: 0,
                child:  this.tag != null 
                    ? Container(
                         padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                         decoration: BoxDecoration(
                              color: tagBackgroundColor,
                              borderRadius: BorderRadius.circular(5.0)
                         ),
                         child: Text(
                             this.tag.toString(),
                             style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  height: 1.5,
                             )
                         ),
                    )
                    : Text(
                      this.caption.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          height: 1.5,
                      ),
                    ),
            )
           ],
      ),
    );
  }
}
