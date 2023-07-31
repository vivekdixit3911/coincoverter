// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last, avoid_print

import 'package:coinconverter/listofcoins.dart';
import 'package:flutter/material.dart';

import 'networking.dart';

String named = "INR";
double currency = 0;
String? formatnumber;

class design extends StatefulWidget {
  const design({super.key});

  @override
  State<design> createState() => _designState();
}

List<DropdownMenuItem<String>> coinreciever() {
  List<DropdownMenuItem<String>> items = [];
  for (var coins in inchange) {
    var valuse = DropdownMenuItem<String>(
      child: Text(coins),
      value: coins,
    );
    items.add(valuse);
  }
  return items;
}

class _designState extends State<design> {
  @override
  Widget build(BuildContext context) {
    void dataintake(String value) async {
      networkingsolution kk = networkingsolution(
          'https://rest.coinapi.io/v1/exchangerate/BTC/$value?apikey=3BE343B2-80FE-4160-B6FE-56C9882A4BDA');
      var response = await kk.fetchdata();

      currency = response['rate'];
      formatnumber = currency.toStringAsFixed(3);
      print(formatnumber);
      setState(() {});
    }

    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
            ),
            child: Text(
              "1 BTC = $formatnumber $named",
              style: TextStyle(fontSize: 26),
            ),
          ),
        ),
        SizedBox(
          height: 432,
        ),
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.black26,
          child: Center(
            child: DropdownButton<String>(
              value: named,
              items: coinreciever(),
              onChanged: (value) {
                setState(
                  () {
                    named = value!;
                    dataintake(named);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
