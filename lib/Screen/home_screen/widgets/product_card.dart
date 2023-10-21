import 'package:flutter/material.dart';
import 'package:liftu_tech_assignment/Model/product_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.press});

  final ProductListModel product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(

            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:BuildNetworkImage(product.images![0]),
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 20 / 4),
              child: Text(
                // products is out demo list
                product.title ?? "",
                // style: TextStyle(color: kTextLightColor),
              ),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }


}

Image BuildNetworkImage(String imageUrl) {
  return Image.network(imageUrl,fit: BoxFit.cover  ,

    loadingBuilder: (BuildContext context, Widget child,
        ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) return child;
      return  Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: Colors.black54,
          rightDotColor: Colors.black54, size: 40,

        ),
      );
    },

    errorBuilder: (context, exception, stackTrace) {
      return Image.asset(
        "assets/icons/error.png",
        fit: BoxFit.cover,
        width: double.infinity,
      );
    },
  );
}