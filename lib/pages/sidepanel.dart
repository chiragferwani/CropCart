import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/contact.dart';
import 'package:grocery_shop_app/pages/grievance.dart';
import 'package:ionicons/ionicons.dart';
import 'project.dart';
import 'navigation.dart';


class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('CropCart', style: TextStyle(fontFamily: 'boldfont', fontSize: 20),),
            accountEmail: Text('Where Farms Meet Families!', style: TextStyle(fontFamily: 'boldfont', fontSize: 16),),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/cropcart.png',
                  
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
                
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.category_outlined, color: Colors.black,),
            title: Text('Categories', style: TextStyle(fontFamily: 'boldfont', color: Colors.black),),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation())),
          ),
          ListTile(
            leading: Icon(Icons.storefront, color: Colors.black,),
            title: Text('Markets', style: TextStyle(fontFamily: 'boldfont', color: Colors.black),),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation())),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart_outlined, color: Colors.black,),
            title: Text('Cart', style: TextStyle(fontFamily: 'boldfont', color: Colors.black),),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation())),
          ),
          ListTile(
            leading: Icon(Icons.sell_outlined, color: Colors.black,),
            title: Text('Offers', style: TextStyle(fontFamily: 'boldfont', color: Colors.black),),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation())),
          ),
          
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.black,),
            title: Text('About', style: TextStyle(fontFamily: 'boldfont', color: Colors.black),),
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProjectScreen())),
          ),
          
          ListTile(
            leading: Icon(Icons.support_agent_outlined, color: Colors.black,),
            title: Text('Grievance', style: TextStyle(fontFamily: 'boldfont', color: Colors.black),),
            onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GrievanceScreen()),
                    ),
          ),
          ListTile(
            leading: Icon(Ionicons.call_outline, color: Colors.black,),
            title: Text('Contact', style: TextStyle(fontFamily: 'boldfont', color: Colors.black),),
            onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    ),
          ),
           ListTile(
            leading: Icon(Icons.exit_to_app_outlined, color: Colors.black,),
            title: Text('Exit', style: TextStyle(fontFamily: 'boldfont', color: Colors.black),),
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(height: 150,),
          ListTile(
            leading: Icon(Ionicons.code_download_outline, color: Colors.black,),
            title: Text('v0.0.9', style: TextStyle(fontFamily: 'boldfont', color: Colors.black),),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}