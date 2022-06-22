import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_resturant/core/configuration.dart';
import 'package:my_resturant/core/db.dart';
import 'package:my_resturant/features/category&products/data/models/product_model.dart';
import 'package:my_resturant/features/category&products/domain/entities/product.dart';
import 'package:my_resturant/features/category&products/presentation/bloc/product/product_bloc.dart';
import 'package:my_resturant/features/category&products/presentation/widgets/product_category_widgets.dart';
import '../widgets/loading_widgets.dart';
import 'item_detail.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BDataHelper bDataHelper = BDataHelper();

    ProductModel product1 = ProductModel(
        productId: 1,
        categoryId: 1,
        title: "Apple",
        rate: 3,
        period: "3 hr",
        level: "Hard");
    ProductModel product2 = ProductModel(
        productId: 2,
        categoryId: 1,
        title: "Apple",
        rate: 3,
        period: "3 hr",
        level: "Hard");
    ProductModel product3 = ProductModel(
        productId: 3,
        categoryId: 1,
        title: "Apple",
        rate: 3,
        period: "3 hr",
        level: "Hard");
    ProductModel product4 = ProductModel(
        productId: 4,
        categoryId: 1,
        title: "Apple",
        rate: 3,
        period: "3 hr",
        level: "Hard");
    ProductModel product5 = ProductModel(
        productId: 5,
        categoryId: 1,
        title: "Apple",
        rate: 3,
        period: "3 hr",
        level: "Hard");
    ProductModel product6 = ProductModel(
        productId: 6,
        categoryId: 1,
        title: "Apple",
        rate: 3,
        period: "3 hr",
        level: "Hard");
    ProductModel product7 = ProductModel(
        productId: 7,
        categoryId: 1,
        title: "Apple",
        rate: 3,
        period: "3 hr",
        level: "Hard");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }
}

Widget _buildBody() {
  return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
    if (state is LoadingProductsState) {
      return LoadingWidget();
    } else if (state is LoadedProductsState) {
      return ProductCategoryWidget(
        listProduc: state.products,
      );
    }
    return LoadingWidget();
  });
}

class FoodItem extends StatelessWidget {
  Product product;
  FoodItem({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => ItemDetail()));
      },
      child: Stack(
        children: [
          Positioned(
            top: 40,
            width: MediaQuery.of(context).size.width / 2.4,
            height: Dimintion.screenHeight >= 750
                ? MediaQuery.of(context).size.height / 4
                : MediaQuery.of(context).size.height / 3.7,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(39, 39, 39, 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 10.5,
            width: MediaQuery.of(context).size.width / 4.4,
            height: MediaQuery.of(context).size.height / 8,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Image.asset(
                  "images/pasta.jpg",
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width / 15,
              top: MediaQuery.of(context).size.height / 7.5,
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    product.title.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RatingBarIndicator(
                    rating: 5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "60",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Min",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.grey,
                          width: 3,
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "Hard",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Lvl",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
