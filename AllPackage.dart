import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pikaaya_customer_seller/Saller/xyz_mart.dart';


class Allpackage extends StatefulWidget {
  const Allpackage({Key? key}) : super(key: key);

  @override
  State<Allpackage> createState() => _OrdermanagementState();
}

class _OrdermanagementState extends State<Allpackage> {
  DateTime _selectedDate = DateTime.now();
  bool _isOnline = false; // This will track the online/offline status
  int _selectedIndex = 0; // To keep track of the currently selected tab
  final PageController _pageController = PageController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
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

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: isWideScreen ? 20 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(isWideScreen ? 60 : 40),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF9C27B0), Color(0xFFCF0A2C)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                      AssetImage('assets/Images/user_avtar.png'),
                      radius: isWideScreen ? 40 : 30,
                    ),
                    SizedBox(width: isWideScreen ? 40 : 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rahul Singh',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: isWideScreen ? 24 : 18),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Offline',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isWideScreen ? 18 : 15),
                              ),
                              SizedBox(width: 5),
                              Switch(
                                activeColor: Colors.green,
                                value: _isOnline,
                                onChanged: (value) {
                                  setState(() {
                                    _isOnline = value;
                                  });
                                },
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Online',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isWideScreen ? 18 : 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Hello XYZ Store, here is your \nseller dashboard!',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => XYZMart()),
                        );
                      },
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.local_grocery_store,
                                  color: Colors.red, size: 40),
                              SizedBox(height: 5),
                              Text(
                                'My Store',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Date Picker Section
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.blue),
                    SizedBox(width: 50),
                    Expanded(
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: Text(
                          DateFormat('dd MMMM yyyy').format(_selectedDate),
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_drop_down, color: Colors.red),
                  ],
                ),
              ),

              Text(
                'All Orders(Please Select)',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(



                  children: [

                    Expanded(

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Text('Recieved', style: TextStyle(fontSize: 18)),
                              SizedBox(height: 10),
                              Text('23',
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),

                    SizedBox(width: 15),
                    Expanded(

                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [

                              Text('Packed', style: TextStyle(fontSize: 18)),
                              SizedBox(height: 10),
                              Text('20',
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),



                  ],

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(



                  children: [

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Action to be taken when "All Orders" is tapped
                          // Navigator.push(
                          //     context,
                          //     // MaterialPageRoute(builder: (context) => Allorders()) // Replace with the appropriate page
                          // );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Text('Picked up', style: TextStyle(fontSize: 18)),
                              SizedBox(height: 10),
                              Text('10',
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Action to be taken when "All Orders" is tapped
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => Allorders()) // Replace with the appropriate page
                          // );
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [

                              Text('Processing', style: TextStyle(fontSize: 18)),
                              SizedBox(height: 10),
                              Text('37',
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(



                  children: [

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Action to be taken when "All Orders" is tapped
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => Allorders()) // Replace with the appropriate page
                          // );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Text('Delivered', style: TextStyle(fontSize: 18)),
                              SizedBox(height: 10),
                              Text('43',
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                         // Action to be taken when "All Orders" is tapped
                         //  Navigator.push(
                         //  context,
                         //      MaterialPageRoute(builder: (context) => Allorders()) // Replace with the appropriate page
                         //  );
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [

                              Text('Return', style: TextStyle(fontSize: 18)),
                              SizedBox(height: 10),
                              Text('7',
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(


                  children: [

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Action to be taken when "All Orders" is tapped
                          // Navigator.push(
                              // context,
                              // MaterialPageRoute(builder: (context) => Allorders()) // Replace with the appropriate page
                          // );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Text('Cancelled', style: TextStyle(fontSize: 18)),
                              SizedBox(height: 10),
                              Text('11',
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Action to be taken when "All Orders" is tapped
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => Allorders()) // Replace with the appropriate page
                          // );
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [

                              Text( 'Item Missing', style: TextStyle(fontSize: 18)),
                              SizedBox(height: 10),
                              Text('17',
                                  style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Packed Orders Information',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),

              ListView.builder(
                physics:
                NeverScrollableScrollPhysics(), // Prevent scrolling inside ListView
                shrinkWrap: true,
                itemCount: 3, // Replace with the actual number of orders
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildOrderRow('Order No.', 'ORD-103-1280'),
                            buildOrderRow('Order Date', '13-05-2024'),
                            buildOrderRow('Order Time', 'HH:MM:SS'),
                            buildOrderRow('Customer Name', 'Rahul Singh'),
                            buildOrderRow('Mobile Number', '+91-00000-00000'),
                            buildOrderRow('Address', 'XYZ location'),
                            buildOrderRow('Rider Name', 'NAME SURNAME'),
                            buildOrderRow('Rider Mobile', '+91-99999-99999'),
                            buildOrderRow('Order Value', 'INR 342.00'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.orange[100],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Pending',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),


              ListView.builder(
                physics:
                NeverScrollableScrollPhysics(), // Prevent scrolling inside ListView
                shrinkWrap: true,
                itemCount: 1, // Replace with the actual number of orders
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildOrderRow('Order No.', 'ORD-103-1280'),
                            buildOrderRow('Order Date', '13-05-2024'),
                            buildOrderRow('Order Time', 'HH:MM:SS'),
                            buildOrderRow('Customer Name', 'Rahul Singh'),
                            buildOrderRow('Mobile Number', '+91-00000-00000'),
                            buildOrderRow('Address', 'XYZ location'),
                            buildOrderRow('Rider Name', 'NAME SURNAME'),
                            buildOrderRow('Rider Mobile', '+91-99999-99999'),
                            buildOrderRow('Order Value', 'INR 342.00'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Completed',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildOrderRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    ),
  );
}
