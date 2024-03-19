import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda/screens/home/product_card.dart';
import 'package:tezda/store/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    productStore!.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(productStore!.products);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: const Text("All Products"),
          backgroundColor: Colors.grey.shade100),
      backgroundColor: Colors.grey.shade100,
      body: Observer(
        builder: (context) => GridView.builder(
          itemCount: productStore!.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                productStore!.setSelectedProduct(productStore!.products[index]);
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
                  child: ProductCard(
                    productItem: productStore!.products[index],
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
