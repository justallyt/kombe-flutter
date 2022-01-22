import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kombe/constants/constants.dart';
import 'package:kombe/models/item.dart';

class FurnitureGridItem extends StatelessWidget {
  final Item item;
  final EdgeInsets? margin;

  const FurnitureGridItem({required this.item, this.margin,  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 15.0),
      child: Container(
        margin: margin == null ? EdgeInsets.zero : margin,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset.zero,
                  blurRadius: 15.0)
            ]),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 37.0),
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.bottomCenter,
                            image: AssetImage(item.imagePath))),
                  ),
                  if (item.discountPercent != null)
                    Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${item.discountPercent}%",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10.0),
                            ),
                          ),
                        ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      height: 1.5,
                    )),
                Wrap(
                  spacing: 3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('${Item.format(item.price)}'),
                    if (item.discountPercent != null)
                      Text(
                        "${Item.format(item.originalPrice)}",
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.5,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black38,
                        ),
                      )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      RatingBar.builder(
                          initialRating: item.rating,
                          minRating: 1,
                          itemSize: 12,
                          itemCount: 5,
                          unratedColor: Colors.amber[100],
                          itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 3,
                              ),
                          onRatingUpdate: (rating) => print(rating)),
                      SizedBox(width: 5),
                      Text(
                        "${item.rating}",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
