
import 'package:flutter/material.dart';
import 'package:kombe/constants/constants.dart';

class filterListItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final bool selected;
  final Function() onTap;
  
  const filterListItem({
    Key? key,
    required this.icon,
    required this.title,
    this.selected = false, 
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black12, width: 1))),
          child: Row(
            children: [
              icon,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
              if(selected)
                Icon(
                  Icons.check,
                  color: primaryColor,
                )
            ],
          ),
        ));
  }
}
