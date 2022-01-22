import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kombe/constants/constants.dart';
import 'package:kombe/screens/categories/widgets/color_list.dart';
import 'package:kombe/screens/categories/widgets/filter_list.dart';

class FilterModalBottomSheet extends StatelessWidget {
  const FilterModalBottomSheet({Key? key}) : super(key: key);

  void close(context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(28.0),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                alignment: Alignment.centerLeft,
                child: InkWell(
                  child: Icon(Icons.close),
                  onTap: () {
                    close(context);
                  },
                ),
              ),
              Text(
                'Filter',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              Container(
                  width: 100,
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      child: Text('Reset',
                          textAlign: TextAlign.right,
                          style:
                              TextStyle(color: primaryColor, fontSize: 14.0)),
                      onTap: () {}))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text('Price Range', style: TextStyle(fontSize: 16.0)),
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20.0),
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Container(
                      width: ((size.width / 2) - 55),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Colors.black12,
                            width: 1,
                          )),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Minimum',
                              border: InputBorder.none)),
                    ),
                    Container(
                      width: 15,
                      height: 1,
                      color: Colors.black38,
                    ),
                    Container(
                      width: ((size.width / 2) - 55),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Colors.black12,
                            width: 1,
                          )),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Maximum',
                              border: InputBorder.none)),
                    ),
                  ])),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text('Item Filter', style: TextStyle(fontSize: 16.0)),
          ),
          Container(
            child: FilterList(onSelect: (selected) => print(selected)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Item Color",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ColorList(
            [
              Colors.white,
              Colors.black87,
              Colors.blue,
              Colors.red,
              Colors.cyan
            ],
            onSelect: (Color color) => print(color),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            width: double.infinity,
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Apply Filter",
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
              onPressed: () {
                close(context);
              },
            ),
          ),
        ],
      ),
    ));
  }
}
