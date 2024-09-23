import 'package:flutter/material.dart';

class MasalaMaggiePage extends StatefulWidget {
  const MasalaMaggiePage({Key? key}) : super(key: key);

  @override
  State<MasalaMaggiePage> createState() => _MasalaMaggiePageState();
}

class _MasalaMaggiePageState extends State<MasalaMaggiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Product Image with gradient background
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6200EA), Color(0xFFCE93D8)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 30,
                  right: 30,
                  child: Image.asset(
                    'assets/Images/masala_maggie.png', // Replace with your image path
                    height: 300,
                    width: 300,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Title and Ratings Row
                  Text(
                    'Mashala Maggie',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,color: Colors.indigo
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Category:',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                'Grocery Store',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'SubCategory:',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            'Stationary Store',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Ratings',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.indigo,
                            ),
                          ),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < 3 ? Icons.star : Icons.star_border,
                                color: Colors.orange,
                                size: 18,
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  // Stock Quantity Input
                  buildTextField('Stock Quantity   ', '2345 Nos.'),
                  SizedBox(height: 20),

                  // Landing Price Input
                  buildTextField('Landing Price    ', '₹88.00'),
                  SizedBox(height: 20),

                  // Selling Price Input
                  buildTextField('Selling Price      ', '₹100.00'),
                  SizedBox(height: 20),

                  // Product Status Input
                  buildTextField('Product Status  ', 'Active'),

                  // Buttons Row
                  Container(
                    margin: EdgeInsets.only(top:0),
                    height: 150,
                    child:   Row(

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        ElevatedButton(

                          onPressed: () {
                            // Edit action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(horizontal: 55, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Edit',style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Update action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Update Listing',style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildTextField(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),

        Align(
          alignment: Alignment.topLeft, // Align the container to the left
          child: Container(
            width: 200, // Set the width here
            height: 50, // Set the height here
            child: TextFormField(
              initialValue: value,
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
