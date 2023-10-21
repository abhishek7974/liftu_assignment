import 'package:flutter/material.dart';
import 'package:liftu_tech_assignment/Screen/home_screen/home_provider/home_provider.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  // By default our first item will be selected



  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeProvider.categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return Consumer<HomeProvider>(
      builder: (context,homeData, child) {
        return GestureDetector(
          onTap: () {
           if(index == 0){
             homeData.getAllProducts(context);
             homeData.changeIntialIndex();
           }
           else {
             homeData.changeIndex(
                 context, index, homeData.categoriesList[index-1].id.toString());
           }
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  homeData.categories[index] ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: homeData.selectedIndex == index ? Colors.black : Colors.blueGrey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2), //top padding 5
                  height: 2,
                  width: 30,
                  color: homeData.selectedIndex == index ? Colors.black : Colors.blueGrey,
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
