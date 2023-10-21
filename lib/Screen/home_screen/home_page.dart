import 'package:flutter/material.dart';
import 'package:liftu_tech_assignment/Screen/home_screen/detail_screen.dart';
import 'package:liftu_tech_assignment/Screen/home_screen/home_provider/home_provider.dart';
import 'package:liftu_tech_assignment/Screen/home_screen/widgets/categories_screen.dart';
import 'package:liftu_tech_assignment/Screen/home_screen/widgets/custom_widgets.dart';
import 'package:liftu_tech_assignment/Screen/home_screen/widgets/product_card.dart';
import 'package:liftu_tech_assignment/main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getAllProducts(context);
    homeProvider.getAllCategories(context);
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: customImage("assets/icons/profile_pic.png", 50),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: TextStyle(color: Colors.black45, fontSize: 16),
            ),
            Text("Abhishek",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
        actions: [
          customImage("assets/icons/notifications-1.png", 30),
          customImage("assets/icons/filter-1-3.png", 30)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Categories(),
            Expanded(
              child:
                  Consumer<HomeProvider>(builder: (context, homeData, child) {
                return homeData.isLoading == true ? LoadingAnimationWidget.fourRotatingDots(color: Colors.black54, size: 50) : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    itemCount: homeData!.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ProductCard(
                      product: homeData.productList[index],
                      press: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DetailsScreen(
                              product: homeData.productList[index]);
                        }));
                      },
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
