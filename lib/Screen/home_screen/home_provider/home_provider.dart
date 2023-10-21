
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:liftu_tech_assignment/Model/categories.dart';
import 'package:liftu_tech_assignment/Model/product_model.dart';
import 'package:liftu_tech_assignment/Services/Api/Api.dart';
import 'package:liftu_tech_assignment/Services/Api/ConfigUrl.dart';

class HomeProvider extends ChangeNotifier {
List<ProductListModel>  productList = [];
List<CategoriesModel>  categoriesList = [];
List<String> categories = [];
int selectedIndex = 0;
bool isLoading = false;
  Future<void> getAllProducts(BuildContext context) async{
    isLoading = true;
    notifyListeners();
    final result = await DioApi.get(path: ConfigUrl.productList, );

    if(result.response != null){
      productList = productListModelFromJson(result.response!.data);
      isLoading = false;
      notifyListeners();
    } else{
      isLoading = false;
      notifyListeners();
      result.handleError(context);
    }

  }

  void changeIndex(BuildContext context ,int index,String id){
    selectedIndex = index;

    if(index != 0){
      getCategoriesProducts(context,id);
    }
    notifyListeners();
  }
  void changeIntialIndex(){
    selectedIndex =0;
  }

  Future<void> getAllCategories(BuildContext context) async{
    isLoading = true;
    notifyListeners();
    final result = await DioApi.get(path: ConfigUrl.categoriesList, );
    if(result.response != null){
      categoriesList = categoriesModelFromJson(result.response!.data);
      categories = categoriesList.map((data) => data.name.toString() ).toList();
      categories.insert(0, "All");
      isLoading = false;
      notifyListeners();
    } else{
      isLoading = false;
      notifyListeners();
      result.handleError(context);
    }
  }
  Future<void> getCategoriesProducts(BuildContext context,String id,)async{
    isLoading = true;
    notifyListeners();
    String finalUrl =  "${ConfigUrl.categoriesList}/$id/products";

    final result = await DioApi.get(path: finalUrl, );
    if(result.response != null){
      productList = productListModelFromJson(result.response!.data);
      isLoading = false;
      notifyListeners();
    } else{
      isLoading = false;
      notifyListeners();
      result.handleError(context);
    }
  }

}