import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Wallet Class
class Wallet {
  String name;
  int total;

  Wallet(this.name, this.total);

  void setTotal(int total){
    this.total = total;
  }
}

// //Wallet Manager
// class WalletManager {
//   List <Wallet> wallets = [];
//   int length = 5;

//   List <Wallet> addWallet (){
//     String name = '';
//     int total = 0; 

//     Wallet x = Wallet(name, total);
//     wallets[length] = x;
//     length++;
//     return wallets;
//   }

//   List <Wallet> removeWallet(){
//     length--;
//     return wallets;
//   }
// }

class WalletOverviewTemplate extends StatelessWidget {
  WalletOverviewTemplate({super.key, required this.child});

  //Wallet Declarition
  final Wallet child;

  @override
  Widget build(BuildContext context) {
    
    //Formatting to currency
    NumberFormat numberFormat = NumberFormat.decimalPattern();

    //Wallet Box
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 20),
      width: 128,
      height: 97,
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 243, 243, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [BoxShadow(
          color: Color.fromRGBO(36, 40, 40, 0.05),
          offset: Offset(0, 6),
          blurRadius: 9.5,
          spreadRadius: 0,
        )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Wallet Name
          Text(
            child.name,
            style: TextStyle(
              color: Color.fromRGBO(36, 40, 40, 0.6),
              fontSize: 12.98,
            ),
          ),

          //Wallet Nominal
          Text(
            numberFormat.format(child.total),
            style: TextStyle(
              color: Color.fromRGBO(146, 208, 211, 1.0),
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
