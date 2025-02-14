import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/adminlogin.dart';
import 'package:grocery_shop_app/pages/orderdetails.dart';
import 'package:ionicons/ionicons.dart';
import 'navigation.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
         leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation()));
          },
        ),
      title: Text("About Project", style: TextStyle(fontFamily: 'boldfont'),),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Project Logo
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/cropcart.png"), // Replace with actual logo path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Project Name
              Text(
                "CropCart",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'boldfont',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),

              // Punchline
              Text(
                "Where Farms Meet Families!",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'boldfont',
                  
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Short Description
              Text(
                "CropCart aims to revolutionize the farm-to-table supply chain by building a hyper-localized delivery system. The project seeks to empower farmers, enhance consumer satisfaction, and promote sustainability by addressing the inefficiencies of traditional supply chains.",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'boldfont',
                  color: Colors.black,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 24),
              // Features Section

              // Features Icons
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final features = [
                    {"icon": Icons.shopping_basket_outlined, "label": "Groceries"},
                    {"icon": Icons.storefront, "label": "Markets"},
                    {"icon": Icons.category_outlined, "label": "Categories"},
                    {"icon": Icons.shopping_cart_outlined, "label": "Cart"},
                    {"icon": Icons.sell_outlined, "label": "Offers"},
                    {"icon": Icons.local_shipping_outlined, "label": "Delivery"},
                    {"icon": Icons.eco_outlined, "label": "Fresh"},
                    {"icon": Icons.agriculture_outlined, "label": "Organic"},
                  ];

                  return Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 126, 217, 87),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          features[index]["icon"] as IconData,
                          size: 28,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        features[index]["label"] as String,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                    ],
                  );
                },
              ),
              SizedBox(height: 50,),
              FloatingActionButton.extended(onPressed: (){
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminLoginPage(),
                    ),
                  );
            }, 
            icon: Icon(Icons.admin_panel_settings_outlined, ), 
             label: Text("Admin", style: TextStyle(fontFamily: 'boldfont', fontSize: 18),),
            backgroundColor: Colors.green,  
            foregroundColor: Colors.white,  
            )
            ],
          ),
        ),
      ),
    );
  }
}