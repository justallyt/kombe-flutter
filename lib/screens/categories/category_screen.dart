import 'package:flutter/material.dart';
import 'package:kombe/data/fake.dart';
import 'package:kombe/models/category.dart';
import 'package:kombe/screens/categories/widgets/furniture_grid_item.dart';
import 'package:kombe/screens/categories/widgets/head_sliver.dart';
import 'package:kombe/widgets/app_bottom_navigator.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  const CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigator(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: HeaderSliver(
                minExtent: 120,
                maxExtent: 120,
                category: widget.category,
              ),
            ),
            SliverGrid.count(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: Fake.furniture.asMap().entries.map((f) {
                  return FurnitureGridItem(
                      item: f.value,
                      margin: EdgeInsets.only(
                        left: f.key.isEven ? 16.0 : 0,
                        right: f.key.isOdd ? 16.0 : 0,
                      ));
                }).toList()),
          ],
        ),
      ),
    );
  }
}
