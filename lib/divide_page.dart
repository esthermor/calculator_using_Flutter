import 'package:flutter/material.dart';

class dividePage extends StatelessWidget {
  const dividePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Divider'),),
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
              children:  [
                Image.network('https://cdn0.iconfinder.com/data/icons/typicons-2/24/divide-outline-512.png', scale: 10,)
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