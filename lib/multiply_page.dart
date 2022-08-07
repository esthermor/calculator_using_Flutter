import 'package:flutter/material.dart';
import 'main.dart';

class multiplyPage extends StatelessWidget {
  const multiplyPage(BuildContext context, {Key? multiply}) : super(key: multiply);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Multiplier'),),
    body: Column(
  children: [
      Center(
        child: Stack(
          children: <Widget>[
            Container(margin: EdgeInsets.fromLTRB(0,50,0,30),
              width: 250,
              height: 50,
    ),
          Positioned(
            bottom: 0,
              child: Container(
                width: 250,
                height: 50,
    decoration: BoxDecoration(
    color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all()
    ),
    )
            ),
            Positioned(
              left: 10,
                bottom: 40,
                child: Container(
                  color: Colors.white,
                  child: Text('User Input:'),))
          ],
        ),
      ),

      Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network('https://cdn-icons-png.flaticon.com/512/43/43165.png', scale: 10,)
          ],
        ),
      ),
    Center(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0,10,0,0),
            width: 250,
            height: 50,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all()
                ),
              )
          ),
          Positioned(
              left: 10,
              bottom: 40,
              child: Container(
                color: Colors.white,
                child: Text('Counter:'),))
        ],
      ),
    ),

      Container(
        child: Column(
          children: [
            Text('=', style: TextStyle(
              fontSize: 50,
            ),),
          ],
        ),
      ),

    Center(
      child: Stack(
        children: <Widget>[
          Container(margin: EdgeInsets.fromLTRB(0,0,0,30),
            width: 250,
            height: 50,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all()
                ),
              )
          ),
          Positioned(
              left: 10,
              bottom: 40,
              child: Container(
                color: Colors.white,
                child: Text('Answer:'),))
        ],
      ),
    ),
  ],
),



    );
  }
}
