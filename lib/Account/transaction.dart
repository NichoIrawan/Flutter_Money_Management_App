// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//Transaction Class
class Transaction {
  String name;
  String category = "Other";
  DateTime date = DateTime.now();
  int nominal;

  Transaction({required this.name, required this.nominal});
}


class MyTransactionTemplate extends StatelessWidget {
  const MyTransactionTemplate({super.key});

  @override
  Widget build(BuildContext context) {

    //Transaction Box
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1, 
            color: Color.fromRGBO(36, 40, 40, 0.2),
          )
        )
      ),
      margin: EdgeInsets.only(left: 1, bottom: 20),
      padding: EdgeInsets.only(bottom: 15, top: 5),
      child: Row(
        children: [

          //Transaction Icon Background
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(146, 208, 211, 1.0),
              borderRadius: BorderRadius.circular(100)
            ),

            //Transaction Icon
            child: Icon(
              Icons.fastfood_rounded, 
              size: 24.29,
              color: Color.fromRGBO(242, 243, 243, 1.0),
            ),
          ),

          //Transaction text
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                
                //Transaction name
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 20,
                  child: Text(
                    'Makan malam',
                    style: TextStyle(
                      fontSize: 16.51,
                      color: Color.fromRGBO(36, 40, 40, 0.8)
                    ),
                  ),
                ),

                //Transaction Time
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 20,
                  child: Text(
                      'Today',
                      style: TextStyle(
                      fontSize: 12.98,
                      color: Color.fromRGBO(36, 40, 40, 0.6)
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Transaction nominal
          Expanded(
            child: Container(
              alignment: Alignment.centerRight, 
              child: Text(
                'Rp 25,000',
                style: TextStyle(
                  fontSize: 16.51,
                  color: Color.fromRGBO(36, 40, 40, 0.8),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}