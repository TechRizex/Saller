import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/Saller/customer_saller.dart';

class Sallerprofile extends StatefulWidget {
  const Sallerprofile({Key? key}) : super(key: key);

  @override
  State<Sallerprofile> createState() => _Customerprofilepage();
}

class _Customerprofilepage extends State<Sallerprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 50),
                height: 30,
                width: 180,
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.purple[200],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.indigo),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications logic here
              // For example, navigate to a notifications screen
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout logic here
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text('Logout'),
                  content: Text('Are you sure you want to logout?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle logout action here
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerSaller()));
                        // You might want to navigate to the login screen
                      },
                      child: Text('Logout'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Gradient background color
                Container(
                  height: 210,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.purple], // Gradient colors
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)), // Optional: add rounded corners to the bottom
                  ),
                ),
                Positioned(
                  top: 10,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/Images/user_avtar.png'), // Replace with actual image
                  ),
                ),
                Positioned(
                  top: 120,
                  child: Column(
                    children: [
                      Text(
                        'Rahul Singh',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Hii You have no recent orders',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Personal Information',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text('Edit'),
                              ),
                            ],
                          ),
                          Divider(),
                          buildInfoField('Name', 'Rahul Singh'),
                          buildInfoField('Father\'s Name', '(optional)'),
                          buildInfoField('Date of Birth', '(optional)'),
                          buildInfoField('Address', '(optional)'),
                          buildInfoField('Phone Number', '+91-84482-92236'),
                          buildInfoField('E-Mail', 'XYZ@abc.com'),
                        ],
                      ),
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

  Widget buildInfoField(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
