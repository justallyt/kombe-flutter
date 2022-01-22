import 'package:flutter/material.dart';
import 'package:kombe/data/fake.dart';
import 'package:kombe/screens/categories/category_screen.dart';
import 'package:kombe/screens/widgets/category_card.dart';
import 'package:kombe/screens/widgets/header.dart';
import 'package:kombe/screens/widgets/image_card.dart';
import 'package:kombe/screens/widgets/promo_card.dart';
import 'package:kombe/screens/widgets/section.dart';
import 'package:kombe/widgets/app_bottom_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onCategorySelected(category) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CategoryScreen(category: category)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AppBottomNavigator(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                Section(
                    'Categories',
                    Fake.categories.map((c) {
                      return CategoryCard(
                          title: c.title,
                          iconPath: c.iconPath,
                          onTap: () {
                            onCategorySelected(c);
                          });
                    }).toList()),
                Section(
                    'Today\'s Promo',
                    Fake.promotions.map((p) {
                      return PromoCard(
                        title: p.title,
                        subtitle: p.subtitle,
                        tag: p.tag,
                        caption: p.caption,
                        imagePath: p.imagePath,
                        backgroundImagePath: p.backgroundImagePath,
                        reverseGradient: p.reverseGradient,
                      );
                    }).toList()),
                Section(
                    'Kombe Matrend',
                    Fake.trending
                        .map((imagePath) => ImageCard(imagePath))
                        .toList()),
                Section(
                    'Kombe mobedo Featured',
                    Fake.featured
                        .map((imagePath) => ImageCard(imagePath))
                        .toList())
              ],
            ),
          ),
        ));
  }
}
