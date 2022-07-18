import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  const ProductsGrid(this.showFavs, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // 아래의 데이터를 이용하지 않는 위젯이나 페이지로 이동한다면, data clean이 필요한데,
        // ChangeNotifier가 자동으로 사용하지 않는 데이터를 dispose 해줌, 데이터가 메모리 차지를 하지 않음.

        // ChangeNotifierProvider (create : (ctx) => products[i]) ---> 생성 후, 클린?
        // 이 상태에서 좋아요 리스트만 보려고 할 때, 버그 -> 에러
        // (좋아요 누른 아이템 보여준게 아니라 그냥 개수만큼 리스트 -> Exception caught by widgets library)
        value: products[i],
        child: const ProductItem(
            // id: products[i].id,
            // title: products[i].title,
            // imageUrl: products[i].imageUrl,
            ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
