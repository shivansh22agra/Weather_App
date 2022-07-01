import 'package:flutter/material.dart';
import 'package:weather_app/const.dart';

class City extends StatelessWidget {
  String? CityName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    leading: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back)),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, CityName);
                  },
                  child: Text(
                    "Get Weather",
                    style: ktext,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Expanded(
                  flex: 1,
                  child: TextField(
                    onChanged: (value) {
                      CityName = value;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Write city name",
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(Icons.location_city),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Expanded(
                  flex: 10,
                  child: Container(
                    child: Text(""),
                  ))
            ],
          ),
          // child:  Text("Get Weather",
          // style: ktext,),

          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/city_background.jpg"),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
