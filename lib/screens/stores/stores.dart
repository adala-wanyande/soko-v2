import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:soko_v2/screens/stores/stores_list.dart';
import 'package:soko_v2/widgets/primary_icon_filled_button.dart';
import 'package:soko_v2/widgets/category_item.dart';
import 'package:soko_v2/widgets/shop_grid.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StoresScreenState createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  int _currentIndex = 0;

  final List<Widget> _shopGrids = [
    const ShopGrid(logos: [
      'assets/logos/gleam_boutique.png',
      'assets/logos/harvest_bliss.png',
      'assets/logos/luminous_glow.png',
      'assets/logos/smoky_trails.jpg',
    ]),
    const ShopGrid(logos: [
      'assets/logos/urban_oasis.jpg',
      'assets/logos/urban_threads.png',
      'assets/logos/velocity_gear.png',
      'assets/logos/vital_bloom.png',
    ]),
    const ShopGrid(logos: [
      'assets/logos/vitacare_pharmacy.jpg',
      // 'assets/logos/logo_1.jpg',
      // 'assets/logos/logo_2.jpg',
      // 'assets/logos/logo_2.jpg',
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stores'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StoresListScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Stores By Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StoresListScreen()),
                        );
                      },
                      child: const CategoryItem(
                          title: 'All',
                          imagePath: 'assets/categories/all.jpg')),
                  const CategoryItem(
                      title: 'Home & Living',
                      imagePath: 'assets/categories/home.jpg'),
                  const CategoryItem(
                      title: 'Entertainment',
                      imagePath: 'assets/categories/entertainment.jpg'),
                  const CategoryItem(
                      title: 'Food', imagePath: 'assets/categories/food.jpg'),
                  const CategoryItem(
                      title: 'Services',
                      imagePath: 'assets/categories/services.jpg'),
                ],
              ),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              indent: 0,
              endIndent: 0,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Discover Stores',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            CarouselSlider(
              items: _shopGrids,
              options: CarouselOptions(
                height: 380, // Adjust based on your content
                enlargeCenterPage: true,
                viewportFraction: 0.85,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Center(
              child: DotsIndicator(
                dotsCount: _shopGrids.length,
                position: _currentIndex.toInt(),
                decorator: DotsDecorator(
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: PrimaryIconFilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StoresListScreen()),
                  );
                },
                text: 'Discover all 150+ Shops',
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
