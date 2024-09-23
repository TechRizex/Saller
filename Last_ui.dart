import 'package:flutter/material.dart';


class Finalscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Payments Dashboard'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildHeaderSection(context),
                SizedBox(height: 16.0),
                _buildPaymentsManagementSection(context),
                SizedBox(height: 32.0),
                _buildBankingDetailsSection(context),
                SizedBox(height: 32.0),
                _buildPaymentDetailsSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          children: [
            CircleAvatar(
              radius: 24.0,
              backgroundImage: AssetImage('assets/profile.jpg'), // Placeholder image
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Anjalina Mathue',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'XYZ Store',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Text('Offline', style: TextStyle(color: Colors.red)),
                    Switch(value: true, onChanged: (bool value) {}),
                    Text('Online', style: TextStyle(color: Colors.green)),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Text(
          'Hello XYZ Store, here is your Payment dashboard!',
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Icon(Icons.calendar_today, color: Colors.grey),
            SizedBox(width: 8.0),
            Text(
              '06 April 2024',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.store, color: Colors.pink),
              onPressed: () {},
            ),
          ],
        ),
      ],
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
              title: 'Current Balance',
              amount: 'INR 880.00',
              color: Colors.orange.shade100,
              iconColor: Colors.orange,
            ),
            SizedBox(width: 8.0),
            _buildBalanceCard(
              context,
              title: 'Withdrawable Balance',
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

  Widget _buildPaymentDetailsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Details',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 7, // Number of payment records
          itemBuilder: (context, index) {
            return _buildPaymentDetailRow(
              amount: 'INR 320.00',
              commission: 'INR 32.0',
              createTime: '10:30 AM',
              updateTime: '11:00 AM',
              status: 'Success',
            );
          },
        ),
      ],
    );
  }

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
