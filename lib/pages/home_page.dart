import 'dart:ui';
import 'package:currency_converter/functions/fetchrates.dart';
import 'package:currency_converter/models/ratesmodels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Color(0xFF212936);
  Color secondaryColor = Color(0xFF2849E5);
  final formkey = GlobalKey<FormState>();
  late Future<RatesModel> result;
  late Future<Map> result2;

  @override
void initState() {
    super.initState();
    result=fetchrates();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    child: Text("Currency Convertor",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    width: 160,
                    height:100,
                    child: Image.asset('assets/home.png'),
                  )
                ],
              ),
              SingleChildScrollView(
                child: Form(key: formkey,
                child: FutureBuilder<RatesModel>(
                  future: result, 
                  builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting)
                  {
                    return Center(
                      child: CircularProgressIndicator(),
                      );
                  }
                  return Text(snapshot.data!.rates.toString(),
                  );
                }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
