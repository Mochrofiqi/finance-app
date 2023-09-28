import 'package:flutter/material.dart';
import 'package:sqlitedatabases/pages/cash-flow_data.dart';
import 'package:sqlitedatabases/pages/income.dart';
import 'package:sqlitedatabases/pages/setting.dart';
import 'package:sqlitedatabases/pages/expense.dart';
import 'package:sqlitedatabases/database/dbhelper.dart';
import 'package:intl/intl.dart';

import 'login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var db = DBHelper();
  var formatCurrency = NumberFormat.currency(locale: 'id', symbol: 'Rp. ');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Flexible(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blueGrey,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Finance Statements',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: FutureBuilder(
                      future: db.getTotalNominalByType('Income'),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }

                        var data = snapshot.data;

                        return snapshot.hasData
                            ? Text(
                                "Finance Income : " +
                                    formatCurrency.format(data),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                ),
                              )
                            : const Text(
                                'Rp. 0',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                              );
                      },
                    ),
                  ),
                  Center(
                    child: FutureBuilder(
                      future: db.getTotalNominalByType('Expense'),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }

                        var data = snapshot.data;

                        return snapshot.hasData
                            ? Text(
                                "Finance Expense : " +
                                    formatCurrency.format(data),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Colors.red,
                                ),
                              )
                            : const Text(
                                'Rp. 0',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                ),
                              );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Image(
                      image: Image.asset('assets/icons/hero.jpg').image,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Income(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(40),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(40)),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Column(
                                children: const [
                                  Image(
                                    image:
                                        AssetImage('assets/icons/income.png'),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Income',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Expense(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(20)),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Column(
                                children: const [
                                  Image(
                                    image:
                                        AssetImage('assets/icons/expense.png'),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Expense',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CashflowData(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(20)),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Column(
                                children: const [
                                  Image(
                                    image: AssetImage(
                                        'assets/icons/cash-flow.png'),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Cash Flow',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Setting(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(50)),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Column(
                                children: const [
                                  Image(
                                    image:
                                        AssetImage('assets/icons/setting.png'),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Setting',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          child: const Text('Logout'),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            textStyle: const TextStyle(
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            minimumSize: const Size.fromHeight(50),
          ),
        ),
      ),
    );
  }
}
