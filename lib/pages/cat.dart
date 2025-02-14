import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Category Section")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CategoryGrid(),
        ),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "Vegetables", "image": "assets/images/vegetables.png"},
    {"name": "Fruits", "image": "assets/images/fruits.png"},
    {"name": "Herbs", "image": "assets/images/pulses.png"},
    {"name": "Dairy", "image": "assets/images/dairy.png"},
    {"name": "Meat", "image": "assets/images/herbs.png"},
    {"name": "Spices", "image": "assets/images/nuts.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 columns
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1, // Square boxes
      ),
      itemBuilder: (context, index) {
        return CategoryCard(
          name: categories[index]["name"]!,
          image: categories[index]["image"]!,
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;

  CategoryCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, width: 70, height: 70, fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
