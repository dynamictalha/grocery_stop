import 'package:flutter/material.dart';
import 'package:fruitstore/model/cart_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel>(builder: (context,value,child){
        return Column(
        children: [
           Padding(
              padding: EdgeInsets.symmetric(horizontal:20 ),
              child: Text("My Cart",
              style: GoogleFonts.notoSerif(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            ),
          // List of cart items
          Expanded(child: ListView.builder(
            itemCount: value.cartItems.length,
            itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListTile(
                  leading: Image.asset(value.cartItems[index][2],height: 30,),
                  title: Text(value.cartItems[index][0]),
                  subtitle: Text("Rs" + value.cartItems[index][1]),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: ()=>
                        Provider.of<CartModel>(context,listen: false).
                        removeItemFromCart(index),
                    ),
                ),
              ),
            );
          })
      ),

      // total price + pay now
       Padding(
         padding: const EdgeInsets.all(20.0),
         child: Container(
         
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const Text("Total Price",
                 style: TextStyle(color: Colors.white54),),
                 Text("RS. " + value.calculateTotal(),
                 style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                 ),)
              ],
             ),
              // pay button
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.shade100),
                ),
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text("Pay Now",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                    Icon(Icons.arrow_forward_ios,color: Colors.white,size: 14,)
                  ],
                ),
              )
              
            ],
          ),
         ),
       )
      ],
     
     
     
      );
      })
    );
  }
}