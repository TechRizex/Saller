import 'package:flutter/material.dart';
import 'package:pikaaya_customer_seller/Saller/xyz_mart.dart';

import 'OrderManagement.dart';


class Sallerwallet extends StatefulWidget {
  const Sallerwallet({Key? key}) : super(key: key);

  @override
  State<Sallerwallet> createState() => _SallerwalletState();
}

class _SallerwalletState extends State<Sallerwallet> {

  bool _isOnline = false;
  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
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

          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(isWideScreen ? 60 : 40),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF9C27B0), Color(0xFFCF0A2C)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),

                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {

                          print('Avatar clicked');

                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ordermanagement()));
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/Images/user_avtar.png'),
                          radius: isWideScreen ? 40 : 30,
                        ),
                      ),
                      SizedBox(width: isWideScreen ? 40 : 30),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rahul Singh',
                              style: TextStyle(color: Colors.white, fontSize: isWideScreen ? 24 : 18),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  'Offline',
                                  style: TextStyle(color: Colors.white, fontSize: isWideScreen ? 18 : 15),
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
                                  style: TextStyle(color: Colors.white, fontSize: isWideScreen ? 18 : 15),
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
                  padding: EdgeInsets.all(10.0),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  XYZMart()),);

                        },
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.local_grocery_store, color: Colors.red, size: 40),
                                SizedBox(height: 5),
                                Text(
                                  'My Store',
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),

                SizedBox(height: 16.0),
                _buildPaymentsManagementSection(context),
                SizedBox(height: 32.0),
                _buildBankingDetailsSection(context),
                SizedBox(height: 32.0),
                Text('Payment Details',style: TextStyle(fontStyle: FontStyle.italic,fontSize:25),
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

                              buildOrderRow('amount', 'INR 320.00'),
                            buildOrderRow('commission', 'INR 32.0'),
                              buildOrderRow('createTime' ,'10:30 AM'),
                              buildOrderRow('updateTime','11:00 AM'),

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
                                      color: Colors.green ,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'Success',
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
      ),
    );
  }


  Widget _buildPaymentsManagementSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payments Management',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        Row(
          children: [
            _buildBalanceCard(
              context,
              title: 'Current \nBalance',
              amount: 'INR 880.00',
              color: Colors.orange.shade100,
              iconColor: Colors.orange,
            ),
            SizedBox(width: 5.0),
            _buildBalanceCard(
              context,
              title: 'Withdrawable\nBalance',
              amount: 'INR 800.00',
              color: Colors.pink.shade100,
              iconColor: Colors.pink,
            ),
          ],
        ),
        SizedBox(height: 16.0),
        _buildWithdrawCard(context),
      ],
    );
  }

  Widget _buildBankingDetailsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Banking Details',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        _buildBankingDetailsForm(context),
      ],
    );
  }
  //
  // Widget _buildPaymentDetailsSection(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Payment Details',
  //         style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(height: 16.0),
  //       ListView.builder(
  //         shrinkWrap: true,
  //         physics: NeverScrollableScrollPhysics(),
  //         itemCount: 7, // Number of payment records
  //         itemBuilder: (context, index) {
  //           return _buildPaymentDetailRow(
  //             amount: 'INR 320.00',
  //             commission: 'INR 32.0',
  //             createTime: '10:30 AM',
  //             updateTime: '11:00 AM',
  //             status: 'Success',
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget _buildBalanceCard(BuildContext context,
      {required String title,
        required String amount,
        required Color color,
        required Color iconColor}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Icon(Icons.account_balance_wallet, color: iconColor),
                SizedBox(width: 8.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              amount,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWithdrawCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.attach_money, color: Colors.green),
              SizedBox(width: 8.0),
              Text(
                'Withdraw Amount',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Amount',
              suffixIcon: Icon(Icons.arrow_forward, color: Colors.green),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankingDetailsForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTextField(label: 'Bank Name', hintText: 'IDFC FIRST BANK'),
          SizedBox(height: 16.0),
          _buildTextField(label: 'IFSC Code', hintText: 'IDFC0000000 (XYZ BRANCH)'),
          SizedBox(height: 16.0),
          _buildTextField(label: 'Account Number', hintText: '1234567890123456'),
          SizedBox(height: 16.0),
          _buildTextField(label: 'Account Holder Name', hintText: 'Name SurName'),
        ],
      ),
    );
  }

  Widget _buildPaymentDetailRow({
    required String amount,
    required String commission,
    required String createTime,
    required String updateTime,
    required String status,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Amount', style: TextStyle(color: Colors.black)),
                Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Commission', style: TextStyle(color: Colors.black)),
                Text(commission, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create Time', style: TextStyle(color: Colors.black)),
                Text(createTime, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Update Time', style: TextStyle(color: Colors.black)),
                Text(updateTime, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Status', style: TextStyle(color: Colors.black)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
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
