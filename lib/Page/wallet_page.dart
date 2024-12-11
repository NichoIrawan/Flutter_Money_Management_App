// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../navbar.dart';
import '../Account/wallet.dart';

class MyWallet extends StatelessWidget {
  MyWallet({super.key});

  //Data Declaration (Will be changed to user input)
  final List <Wallet> wallets = [
    Wallet('Gopay', 300000), 
    Wallet('Cash', 500000), 
    Wallet('Saving', 20000000), 
    Wallet('Invest', 40000000),
    Wallet('Ovo', 200000),
  ];  

  final int totalWallet = 10000000;

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
        children: [
          WalletOverview(child: totalWallet),
          Expanded(
            // padding: EdgeInsets.only(left: 10, right: 10),
            child: GridView.builder(
              itemCount: wallets.length,
              shrinkWrap: true,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: max(1, MediaQuery.sizeOf(context).width ~/ 165), 
                childAspectRatio: 165/121,
              ),
              itemBuilder: (context, index) {
                return WalletPageTemplate(
                  child: wallets[index],
                );
              }
            ),
          ),
        ],
      ),

      //Navbar
      bottomNavigationBar: navbar(),
    );
  }
}

class WalletOverview extends StatelessWidget {
  const WalletOverview({super.key, required this.child});

  final int child;

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat.decimalPattern();

    return Container(
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
      height: 98,
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Saldo Saya",
            style: TextStyle(color: Color.fromRGBO(38, 40, 40, 0.6),),
          ),
          Row(
            children: [
              Text(
                  numberFormat.format(child),
                  style: TextStyle(color: Color.fromRGBO(146, 208, 211, 1.0),),
              ),
              SizedBox(
                width: 40,
                child: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Color.fromRGBO(146, 208, 211, 1.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}