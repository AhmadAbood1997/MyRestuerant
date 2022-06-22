import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_resturant/core/configuration.dart';
import 'package:my_resturant/core/dummy_data.dart';
import 'package:my_resturant/features/category&products/domain/entities/product.dart';
import 'package:my_resturant/features/category&products/presentation/pages/main_page.dart';

class ProductCategoryWidget extends StatelessWidget {
  List<Product> listProduc = [];
  ProductCategoryWidget({required this.listProduc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi Ahmad",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            Text(
                              "Ready to cook for dinner?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: PrimaryColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("images/ahmad.jpg",
                                fit: BoxFit.cover),
                          ),
                          width: 55,
                          height: 55,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width - 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("images/food_cover.jpg",
                              fit: BoxFit.fill),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 20,
                        child: Text(
                          "Menu for dinner",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                      Positioned(
                        top: 65,
                        left: 20,
                        child: Text(
                          "Chicken Baked",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: PrimaryColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 17,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: PrimaryColor,
                              ),
                              child: Icon(
                                Icons.timer_sharp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "30 min",
                              style: TextStyle(
                                  color: PrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: PrimaryColor,
                              ),
                              child: Icon(
                                Icons.fence_sharp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Easy lvl",
                              style: TextStyle(
                                  color: PrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Meal Category",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 60,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: PrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                              "images/cupcakes.jpg",
                                              fit: BoxFit.cover),
                                        ),
                                        width: 35,
                                        height: 50,
                                      ),
                                      Text(
                                        "Dinner",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      ),
                                    ]),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(10),
                      children: listProduc
                          .map((product) => FoodItem(
                                product: product,
                              ))
                          .toList(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 190,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio:
                            Dimintion.screenHeight >= 750 ? 0.65 : 0.75,
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
