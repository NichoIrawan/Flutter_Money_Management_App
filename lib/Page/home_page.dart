// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_money_management/Account/transaction.dart';
import 'package:flutter_money_management/Chart/pie_chart.dart';
import 'package:flutter_money_management/navbar.dart';
import 'package:flutter_money_management/Account/wallet.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  //Data Declaration (Will be changed to user input)
  final List <Wallet> wallet = [
    Wallet('Gopay', 300000), 
    Wallet('Cash', 500000), 
    Wallet('Saving', 20000000), 
    Wallet('Invest', 40000000),
    Wallet('Ovo', 200000),
  ];  
  
  final List transaction = [
    'Transaction 1',
    'Transaction 2',
    'Transaction 3',
    'Transaction 4', 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 240, 240, 1.0),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //Menu placeholder (will be changed to sidebar menu)
            Icon(
              Icons.menu,
              size: 30.9,
              color: Theme.of(context).colorScheme.secondary,
            ),

            //Notification button (Have an active state and will navigate to notification page)
            IconButton(
              onPressed: (){}, 
              icon: Icon(
                Icons.notifications,
                size: 30.9,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          ]
        ),
      ),
      body: Column(
        children: <Widget> [

          //Overview widget
          Overview(),

          //Wallets
          Container(
            height: 137,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: wallet.length,
              itemBuilder: (context, index) {
                return WalletOverviewTemplate(
                  child: wallet[index],
                );
              }
            ),
          ),

          //Recent Transaction
          Expanded(

            //Outside box
            child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                padding: EdgeInsets.fromLTRB(19, 20, 20, 0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(242, 243, 243, 1.0),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Color.fromRGBO(36, 40, 40, 0.05),
                    offset: Offset(0, 6),
                    blurRadius: 9.5,
                    spreadRadius: 0,
                  )],
                ),

                //Transaction header
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest Transaction',
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                              fontSize: 16.51,
                              color: Color.fromRGBO(38, 40, 40, 0.6),
                            )
                          ),
                          /*TextStyle(
                            color: Color.fromRGBO(36, 40, 40, 0.6)
                          ),*/
                        ),
                        TextButton(
                          child: Text(
                            'See All',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromRGBO(36, 40, 40, 0.6),
                            ),
                          ),
                          style: TextButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                          ),
                          onPressed: (){},
                        ),
                      ],
                    ),

                    //List of recent transaction
                    Expanded(
                      child: ListView.builder(
                        itemCount: transaction.length,
                        itemBuilder: (context, index) {
                          return MyTransactionTemplate();
                        },
                      ),
                    ),
                  ],
                ),
              ),
          )
        ],
      ),

      //Navbar
      bottomNavigationBar: navbar(),
    );
  }
}

//Overview for homepage
class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => OverviewState();
}

class OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 215,
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(36, 40, 40, 0.05),
              offset: Offset(0, 6),
              blurRadius: 9.5,
              spreadRadius: 0,
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 190,
              child: MyPieChart(),
            ),
            Expanded(
              child: Container(
                child: pieChartLegends(),
              )
            )
          ],
        )
      );
  }
}
