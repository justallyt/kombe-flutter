import 'package:flutter/material.dart';
import 'package:kombe/data/fake.dart';
import 'package:kombe/screens/widgets/search_bar.dart';
import 'package:kombe/widgets/cart.dart';


class Header extends StatelessWidget {
  const Header({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
         padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
         width:double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                         "Kombe Shop",
                         style: TextStyle(fontSize: 25.0, height: 1),
                     ),
                    Cart(numberOfItemsInCart: Fake.numberOfItemsInCart),
                  ],
                
              ),
              Text(
                  "Get unique kombe for your home",
                   style: TextStyle(fontSize: 12.0, height: 1.5, color: Colors.black38),
              ),
              SearchBar(),
           ]
        ),
    );
  }
}