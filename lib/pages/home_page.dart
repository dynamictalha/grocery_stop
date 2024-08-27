import 'package:flutter/material.dart';
import 'package:fruitstore/model/cart_model.dart';
import 'package:fruitstore/pages/cart_page.dart';
import 'package:fruitstore/pages/component/Grocery_items.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag,color: Colors.white,),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
           const SizedBox(height: 40,),
            // good morning
           const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Good Morning,"),
            ),
        
            //let's order fresh item for you
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20 ),
              child: Text("Let's order fresh items for you",
              style: GoogleFonts.notoSerif(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            ),
            const SizedBox(height: 20,),
            //divder
           const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:  Divider(
                thickness: 4,
              ),
            ),
        
            // fresh item + grid
             const SizedBox(height: 20,),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Fresh items",
              style: TextStyle(fontSize: 16),),
            ),

            Expanded(
              child: Consumer<CartModel>(builder: (context,value,child){
               return  GridView.builder(
                itemCount: value.shopItems.length,
                padding: EdgeInsets.all(6),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: 1/ 1.3
              ), 
              itemBuilder: (BuildContext context, int index) { 
                return GroceryItemsTitle(
                  itemName: value.shopItems[index][0],
                  itemPrice: value.shopItems[index][1],
                  imagePath: value.shopItems[index][2],
                  color: value.shopItems[index][3],
                  onPressed: (){
                    Provider.of<CartModel>(context,listen: false).
                    addItemCart(index);
                  },
                );
               },
            );
              }
              ),
              ),
           
          ],
        ),
      ),
    );
  }
}