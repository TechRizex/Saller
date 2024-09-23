import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/Saller/tissue_roll.dart';

import 'aata_maggie.dart';
import 'masala_maggie_page.dart';

class XYZMart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Back"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This will pop the current screen
          },
        ),
        backgroundColor: Colors.purple[400], // Matching gradient start color
        elevation: 40,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 160, // Adjusted height
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF9C27B0),
                      Color(0xFFCF0A2C)],
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
              ),
              Align(
                alignment: Alignment.center, // Center the image within the container
                child: CircleAvatar(
                  radius: 70, // Adjusted the size of the circle
                  backgroundColor: const Color(0xFFCF0A2C), // Matching gradient end color
                  child: Image.asset(
                    'assets/Images/store_image.png',
                    height: 120, // Adjusted height of the image
                    width: 120, // Adjusted width of the image
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "XYZ MART",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(
            "Category: Grocery Store",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(
            "Address: Bada Bazar, Chota Chowk, Jammu",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star, color: Colors.orange, size: 20),
              Icon(Icons.star_half, color: Colors.orange, size: 20),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 40, // Adjust the height as needed
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for listed products",
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 8), // Adjust padding to control height
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                productCard(context, "Beco Tissue Roll", "₹100", "₹85", 4, "assets/Images/tissue_roll.png"),
                productCard(context, "Masala Maggie", "₹34", "₹31", 3.5, "assets/Images/masala_maggie.png"),
                productCard(context, "Aata Maggie", "₹40", "₹35", 4, "assets/Images/aata_maggie.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productCard(BuildContext context, String title, String sellingPrice, String landingPrice, double rating, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigate to specific pages based on the product title
        if (title == "Beco Tissue Roll") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TissueRoll()));
        } else if (title == "Masala Maggie") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MasalaMaggiePage()));
        } else if (title == "Aata Maggie") {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AataMaggie()));
        }
      },

      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(20),
          leading: Image.asset(
            imagePath,
            width: 100, // Increased width of the product image
            height: 100, // Increased height of the product image
          ),
          title: Text(title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selling Price: $sellingPrice", style: TextStyle(color: Colors.black)),
              Text("Landing Price: $landingPrice", style: TextStyle(color: Colors.green)),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.orange,
                    size: 20,
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String title;

  ProductDetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF9C27B0),
      ),
      body: Center(
        child: Text('Details of $title', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
