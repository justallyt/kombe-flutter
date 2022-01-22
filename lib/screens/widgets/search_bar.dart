import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
         margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
         padding: EdgeInsets.symmetric(horizontal: 16.0),
         decoration: BoxDecoration(
             color: Colors.white,
             boxShadow: [
                BoxShadow(
                   color: Colors.black.withOpacity(0.075),
                   offset: Offset(0.0, 1.0),
                    blurRadius: 10.0
                )
             ]
         ),
         child: TextFormField(
              decoration: InputDecoration(
                  icon: SvgPicture.asset("assets/icons/search.svg"),
                  hintText: 'Search unique kombe bwana...',
                  hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 14.0,
                  ),
                  border: InputBorder.none,
              )
           ,),
    );
  }
}