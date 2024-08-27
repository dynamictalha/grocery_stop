import 'package:flutter/material.dart';

class GroceryItemsTitle extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;

  void Function()? onPressed;
  GroceryItemsTitle({super.key,
  required this.itemName,
  required this.itemPrice,
  required this.imagePath,
  required this.color,
  required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(
              imagePath,
              height: 50,
            ),

            // item name
            Text(itemName),
            
            // price + button
            MaterialButton(onPressed: onPressed ,
            color: color[800],
            child: Text(
              "Rs" + itemPrice,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold

              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}