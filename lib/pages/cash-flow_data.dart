// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sqlitedatabases/model/cash-flow.dart';
import 'package:sqlitedatabases/database/dbhelper.dart';
import 'package:sqlitedatabases/pages/cash-flow.dart';

class CashflowData extends StatefulWidget {
  const CashflowData({Key? key}) : super(key: key);

  @override
  State<CashflowData> createState() => _CashflowDataState();
}

class _CashflowDataState extends State<CashflowData> {
  var db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Flexible(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue[700], 
                        ),
                        alignment: Alignment.center, 
                        child: Text(
                          'Detail Cash Flow',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                      future: db.getCashflow(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }

                        var data = snapshot.data;

                        return snapshot.hasData
                            ? CashflowPage(data as List<Cashflow>)
                            : const Center(
                                child: Text(
                                  'No Data',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red[600],
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
