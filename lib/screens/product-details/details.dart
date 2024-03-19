import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda/store/index.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic product = productStore!.selectedProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text("${product.title}"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Observer(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300.w,
                    width: 300.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network('${product.image}'),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Observer(builder: (context) {
                            return IconButton(
                              onPressed: () {
                                product.isFavorite
                                    ? productStore!.removeFavorite(product)
                                    : productStore!.addFavorite(product);
                              },
                              icon: product.isFavorite
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(Icons.favorite_border_outlined),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashRadius: null,
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "${product.title}",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      product.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Price : \$${product.price}",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
