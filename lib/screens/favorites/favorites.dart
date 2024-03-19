import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda/screens/favorites/favorite_product_card.dart';
import 'package:tezda/store/index.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Favorite Products"),
          backgroundColor: Colors.grey.shade100),
      backgroundColor: Colors.grey.shade100,
      body: Observer(
        builder: (context) => GridView.builder(
          itemCount: productStore!.favoriteProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                productStore!
                    .setSelectedProduct(productStore!.favoriteProducts[index]);
                Navigator.of(context).pushNamed(
                  "/product_detail",
                );
              },
              child: Center(
                child: Container(
                  width: 200.w,
                  height: 200.h,
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: FavoriteProductCard(
                    productItem: productStore!.favoriteProducts[index],
                  ),
                ),
              ),
            );
          },
          shrinkWrap: true,
        ),
      ),
    );
  }
}
