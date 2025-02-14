import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/cart_page.dart';
import 'package:grocery_shop_app/pages/category.dart';
import 'package:grocery_shop_app/pages/home_page.dart';
import 'package:grocery_shop_app/pages/markets.dart';
import 'package:grocery_shop_app/pages/notification.dart';
import 'package:grocery_shop_app/pages/project.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:provider/provider.dart';
import 'sidepanel.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

    double calculateCropCoins(double totalAmount) {
    return totalAmount * 0.02;
  }


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: 
        Builder(builder: (context) {
          return IconButton(
          icon: const Icon(Icons.menu, color: Colors.black,),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
        }),
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Image.asset("assets/images/trendslogo.png"), // App logo (replace with your actual logo)
        // ),
        
        title: Text("CropCart", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'boldfont')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.yellow),
                SizedBox(width: 5),
                Consumer<CartModel>(
                  builder: (context, value, child) {
                    double cropCoins = calculateCropCoins(value.getTotalAmount());
                    return Text(
                      "${cropCoins.toStringAsFixed(2)} Coins",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    );
                  },
                ),
              ],
            ),
            
          ),
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProjectScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_active_outlined, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NotificationScreen()));
            },
          ),
          
        ],
      ),
      drawer: NavBar(),
        bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'boldfont', fontWeight: FontWeight.bold),
            ),
          ),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            indicatorColor: Colors.white,
            backgroundColor: Colors.white,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined, color: Colors.black, size: 36,),
                selectedIcon: const Icon(Icons.home_rounded, color: Colors.black, size: 36,),
                label: 'Home',
              ),
              NavigationDestination(
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 32,),
                selectedIcon: const Icon(Icons.shopping_bag, color: Colors.black, size: 32,),
                label: 'Shop',
              ),
              NavigationDestination(
                icon: const Icon(Icons.storefront, color: Colors.black, size: 32,),
                selectedIcon: const Icon(Icons.storefront_rounded, color: Colors.black, size: 32,),
                label: 'Markets',
              ),
              NavigationDestination(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 32,),
                selectedIcon: const Icon(Icons.shopping_cart, color: Colors.black, size: 32,),
                label: 'Cart',
              ),
            ],
          ),
        ),
      ),


        body: Obx(() => controller.screens[controller.selectedIndex.value])
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomePage(),
    SolarPanelsScreen(), 
    ScoutScreen(), 
    CartPage()
    ];
}