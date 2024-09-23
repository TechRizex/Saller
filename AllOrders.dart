import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pikaaya_customer_seller/Saller/OrderManagement.dart';
import 'package:pikaaya_customer_seller/Saller/xyz_mart.dart';


class OrderStatusPage extends StatefulWidget {
  @override
  _OrderStatusPageState createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  int selectedBoxIndex = -1; // Initially no box is selected
  List<Map<String, dynamic>> orderDetails = [];// More detailed order data
  DateTime _selectedDate = DateTime.now();
  bool _isOnline = false; // This will track the online/offline status




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



  // Function to handle box click and update state
  void onBoxClick(int index) {
    setState(() {
      selectedBoxIndex = index; // Update selected box index

      // Define the new orders to be displayed based on the selected index
      List<Map<String, dynamic>> newOrders;
      switch (index) {
        case 0:
          newOrders = [
            {
              'orderNo': 'ORD-103-1280',
              'orderDate': '13-05-2024',
              'orderTime': 'HH:MM:SS',
              'customerName': 'Rahul Singh',
              'mobileNumber': '+91 00000-00000',
              'address': 'XYZ location',
              'riderName': 'NAME SURNAME',
              'riderMobile': '+91-99999-99999',
              'orderValue': 'INR 342.00',
              'status': 'Pending',
            },
            {
              'orderNo': 'ORD-103-1280',
              'orderDate': '13-05-2024',
              'orderTime': 'HH:MM:SS',
              'customerName': 'Rahul Singh',
              'mobileNumber': '+91 00000-00000',
              'address': 'XYZ location',
              'riderName': 'NAME SURNAME',
              'riderMobile': '+91-99999-99999',
              'orderValue': 'INR 342.00',
              'status': 'Pending',
            },
            {
              'orderNo': 'ORD-103-1280',
              'orderDate': '13-05-2024',
              'orderTime': 'HH:MM:SS',
              'customerName': 'Rahul Singh',
              'mobileNumber': '+91 00000-00000',
              'address': 'XYZ location',
              'riderName': 'NAME SURNAME',
              'riderMobile': '+91-99999-99999',
              'orderValue': 'INR 342.00',
              'status': 'Pending',
            },
          ];
          break;
        case 1:
          newOrders = [
            {
              'orderNo': 'ORD-103-1281',
              'orderDate': '12-05-2024',
              'orderTime': '10:45 AM',
              'customerName': 'Shyam Patel',
              'mobileNumber': '+91 98765-43210',
              'address': 'ABC Street',
              'riderName': 'Rider XYZ',
              'riderMobile': '+91-98765-43210',
              'orderValue': 'INR 200.00',
              'status': 'Delivered',
            },
            {
              'orderNo': 'ORD-103-1281',
              'orderDate': '12-05-2024',
              'orderTime': '10:45 AM',
              'customerName': 'Shyam Patel',
              'mobileNumber': '+91 98765-43210',
              'address': 'ABC Street',
              'riderName': 'Rider XYZ',
              'riderMobile': '+91-98765-43210',
              'orderValue': 'INR 200.00',
              'status': 'Delivered',
            },
            {
              'orderNo': 'ORD-103-1281',
              'orderDate': '12-05-2024',
              'orderTime': '10:45 AM',
              'customerName': 'Shyam Patel',
              'mobileNumber': '+91 98765-43210',
              'address': 'ABC Street',
              'riderName': 'Rider XYZ',
              'riderMobile': '+91-98765-43210',
              'orderValue': 'INR 200.00',
              'status': 'Delivered',
            },{
              'orderNo': 'ORD-103-1281',
              'orderDate': '12-05-2024',
              'orderTime': '10:45 AM',
              'customerName': 'Shyam Patel',
              'mobileNumber': '+91 98765-43210',
              'address': 'ABC Street',
              'riderName': 'Rider XYZ',
              'riderMobile': '+91-98765-43210',
              'orderValue': 'INR 200.00',
              'status': 'Delivered',
            },


          ];
          break;
        case 2:
          newOrders = [
            {
              'orderNo': 'ORD-103-1282',
              'orderDate': '12-05-2024',
              'orderTime': '10:45 AM',
              'customerName': 'Anil Kumar',
              'mobileNumber': '+91 88888-43210',
              'address': 'DEF Street',
              'riderName': 'Rider ABC',
              'riderMobile': '+91-88888-43210',
              'orderValue': 'INR 500.00',
              'status': 'Cancelled',
            },
            {
              'orderNo': 'ORD-103-1282',
              'orderDate': '12-05-2024',
              'orderTime': '10:45 AM',
              'customerName': 'Anil Kumar',
              'mobileNumber': '+91 88888-43210',
              'address': 'DEF Street',
              'riderName': 'Rider ABC',
              'riderMobile': '+91-88888-43210',
              'orderValue': 'INR 500.00',
              'status': 'Cancelled',
            },  {
              'orderNo': 'ORD-103-1282',
              'orderDate': '12-05-2024',
              'orderTime': '10:45 AM',
              'customerName': 'Anil Kumar',
              'mobileNumber': '+91 88888-43210',
              'address': 'DEF Street',
              'riderName': 'Rider ABC',
              'riderMobile': '+91-88888-43210',
              'orderValue': 'INR 500.00',
              'status': 'Cancelled',
            },


          ];
          break;
        case 3:
          newOrders = [
            {
              'orderNo': 'ORD-103-1283',
              'orderDate': '11-05-2024',
              'orderTime': '11:15 AM',
              'customerName': 'Meena Joshi',
              'mobileNumber': '+91 77777-77777',
              'address': 'GHI Avenue',
              'riderName': 'Rider DEF',
              'riderMobile': '+91-77777-77777',
              'orderValue': 'INR 350.00',
              'status': 'Out for Delivery',
            },
            {
              'orderNo': 'ORD-103-1283',
              'orderDate': '11-05-2024',
              'orderTime': '11:15 AM',
              'customerName': 'Meena Joshi',
              'mobileNumber': '+91 77777-77777',
              'address': 'GHI Avenue',
              'riderName': 'Rider DEF',
              'riderMobile': '+91-77777-77777',
              'orderValue': 'INR 350.00',
              'status': 'Out for Delivery',
            },
            {
              'orderNo': 'ORD-103-1283',
              'orderDate': '11-05-2024',
              'orderTime': '11:15 AM',
              'customerName': 'Meena Joshi',
              'mobileNumber': '+91 77777-77777',
              'address': 'GHI Avenue',
              'riderName': 'Rider DEF',
              'riderMobile': '+91-77777-77777',
              'orderValue': 'INR 350.00',
              'status': 'Out for Delivery',
            },

          ];
          break;
        case 4:
          newOrders = [
            {
              'orderNo': 'ORD-103-1284',
              'orderDate': '10-05-2024',
              'orderTime': '02:30 PM',
              'customerName': 'Suresh Gupta',
              'mobileNumber': '+91 66666-66666',
              'address': 'JKL Colony',
              'riderName': 'Rider GHI',
              'riderMobile': '+91-66666-66666',
              'orderValue': 'INR 450.00',
              'status': 'Returned',
            },
            {
              'orderNo': 'ORD-103-1284',
              'orderDate': '10-05-2024',
              'orderTime': '02:30 PM',
              'customerName': 'Suresh Gupta',
              'mobileNumber': '+91 66666-66666',
              'address': 'JKL Colony',
              'riderName': 'Rider GHI',
              'riderMobile': '+91-66666-66666',
              'orderValue': 'INR 450.00',
              'status': 'Returned',
            },
          ];
          break;
        case 5:
          newOrders = [
            {
              'orderNo': 'ORD-103-1285',
              'orderDate': '09-05-2024',
              'orderTime': '03:00 PM',
              'customerName': 'Amit Verma',
              'mobileNumber': '+91 55555-55555',
              'address': 'MNO Block',
              'riderName': 'Rider JKL',
              'riderMobile': '+91-55555-55555',
              'orderValue': 'INR 250.00',
              'status': 'Failed',
            },
            {
              'orderNo': 'ORD-103-1285',
              'orderDate': '09-05-2024',
              'orderTime': '03:00 PM',
              'customerName': 'Amit Verma',
              'mobileNumber': '+91 55555-55555',
              'address': 'MNO Block',
              'riderName': 'Rider JKL',
              'riderMobile': '+91-55555-55555',
              'orderValue': 'INR 250.00',
              'status': 'Failed',
            },
            {
              'orderNo': 'ORD-103-1285',
              'orderDate': '09-05-2024',
              'orderTime': '03:00 PM',
              'customerName': 'Amit Verma',
              'mobileNumber': '+91 55555-55555',
              'address': 'MNO Block',
              'riderName': 'Rider JKL',
              'riderMobile': '+91-55555-55555',
              'orderValue': 'INR 250.00',
              'status': 'Failed',
            },

          ];
          break;
        case 6: // Processing case
          newOrders = [
            {
              'orderNo': 'ORD-103-1286',
              'orderDate': '14-05-2024',
              'orderTime': '02:00 PM',
              'customerName': 'Vikas Sharma',
              'mobileNumber': '+91 44444-44444',
              'address': 'PQR Colony',
              'riderName': 'Rider MNO',
              'riderMobile': '+91-44444-44444',
              'orderValue': 'INR 150.00',
              'status': 'Processing',
            },
            {
              'orderNo': 'ORD-103-1286',
              'orderDate': '14-05-2024',
              'orderTime': '02:00 PM',
              'customerName': 'Vikas Sharma',
              'mobileNumber': '+91 44444-44444',
              'address': 'PQR Colony',
              'riderName': 'Rider MNO',
              'riderMobile': '+91-44444-44444',
              'orderValue': 'INR 150.00',
              'status': 'Processing',
            }, {
              'orderNo': 'ORD-103-1286',
              'orderDate': '14-05-2024',
              'orderTime': '02:00 PM',
              'customerName': 'Vikas Sharma',
              'mobileNumber': '+91 44444-44444',
              'address': 'PQR Colony',
              'riderName': 'Rider MNO',
              'riderMobile': '+91-44444-44444',
              'orderValue': 'INR 150.00',
              'status': 'Processing',
            },

          ];
          break;
        case 7: // Item Missing case
          newOrders = [
            {
              'orderNo': 'ORD-103-1287',
              'orderDate': '15-05-2024',
              'orderTime': '04:15 PM',
              'customerName': 'Neha Yadav',
              'mobileNumber': '+91 33333-33333',
              'address': 'STU Road',
              'riderName': 'Rider PQR',
              'riderMobile': '+91-33333-33333',
              'orderValue': 'INR 300.00',
              'status': 'Item Missing',
            },
            {
              'orderNo': 'ORD-103-1287',
              'orderDate': '15-05-2024',
              'orderTime': '04:15 PM',
              'customerName': 'Neha Yadav',
              'mobileNumber': '+91 33333-33333',
              'address': 'STU Road',
              'riderName': 'Rider PQR',
              'riderMobile': '+91-33333-33333',
              'orderValue': 'INR 300.00',
              'status': 'Item Missing',
            },
            {
              'orderNo': 'ORD-103-1287',
              'orderDate': '15-05-2024',
              'orderTime': '04:15 PM',
              'customerName': 'Neha Yadav',
              'mobileNumber': '+91 33333-33333',
              'address': 'STU Road',
              'riderName': 'Rider PQR',
              'riderMobile': '+91-33333-33333',
              'orderValue': 'INR 300.00',
              'status': 'Item Missing',
            },
            {
              'orderNo': 'ORD-103-1287',
              'orderDate': '15-05-2024',
              'orderTime': '04:15 PM',
              'customerName': 'Neha Yadav',
              'mobileNumber': '+91 33333-33333',
              'address': 'STU Road',
              'riderName': 'Rider PQR',
              'riderMobile': '+91-33333-33333',
              'orderValue': 'INR 300.00',
              'status': 'Item Missing',
            },
          ];
          break;
        default:
          newOrders = [];
      }

      // Replace the existing list with new orders
      orderDetails = newOrders;
    });
  }

  // Widget to build each status box
  Widget buildStatusBox(int index, String title, String count, Color color) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onBoxClick(index); // Call the click handler
        },
        child: Container(
          decoration: BoxDecoration(
            color: selectedBoxIndex == index ? Colors.blue : color, // Apply the provided color
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
              SizedBox(height: 10),
              Text(count, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build the detailed order view
  Widget buildOrderDetail(Map<String, dynamic> order) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
              Text('Order No: ${order['orderNo']}'),
              Text('Order Date: ${order['orderDate']}'),
              Text('Order Time: ${order['orderTime']}'),
              Text('Customer Name: ${order['customerName']}'),
              Text('Mobile Number: ${order['mobileNumber']}'),
              Text('Address: ${order['address']}'),
              Text('Rider Name: ${order['riderName']}'),
              Text('Rider Mobile: ${order['riderMobile']}'),
              Text('Order Value: ${order['orderValue']}'),
              Row(
                children: [
                  Text('Status: '),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(order['status'], style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.purple,
        title: Row(

          children: [
            // IconButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Ordermanagement()));
            // }, icon:  Icon(Icons.arrow_back)),
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



              // Scrollable container for all widgets
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        buildStatusBox(0, 'Received', '23', Colors.green),
                        SizedBox(width: 15),
                        buildStatusBox(1, 'Packed', '20', Colors.purple),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        buildStatusBox(2, 'Out for Delivery', '15', Colors.orange),
                        SizedBox(width: 15),
                        buildStatusBox(3, 'Delivered', '40', Colors.black),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        buildStatusBox(4, 'Cancelled', '10', Colors.red),
                        SizedBox(width: 15),
                        buildStatusBox(5, 'Returned', '5', Colors.brown),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        buildStatusBox(6, 'Processing', '18', Colors.deepPurpleAccent),  // New "Processing" Box
                        SizedBox(width: 15),
                        buildStatusBox(7, 'Item Missing', '2', Colors.pink),  // New "Item Missing" Box
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Selected Orders Information',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  // ListView to show the detailed order data
                  ListView.builder(
                    shrinkWrap: true, // Ensures the ListView fits inside SingleChildScrollView
                    physics: NeverScrollableScrollPhysics(), // Prevents scrolling inside ListView
                    itemCount: orderDetails.length,
                    itemBuilder: (context, index) {
                      return buildOrderDetail(orderDetails[index]);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
