import 'package:flutter/material.dart';

class FacebookAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/900px-Facebook_Logo_%282019%29.png?20190503112358'), // Facebook icon as leading
        ),
        title: Row(
          children: [
            Text(
              'facebook',
              style: TextStyle(
                color: Colors.blue[800],
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            Spacer(),
            Icon(Icons.home, color: Colors.black),
            SizedBox(width: 15),
            Icon(Icons.people, color: Colors.black),
            SizedBox(width: 15),
            Icon(Icons.notifications, color: Colors.black),
            SizedBox(width: 15),
            Icon(Icons.message, color: Colors.black),
            SizedBox(width: 15),
            Icon(Icons.search, color: Colors.black),
          ],
        ),
      ),
      body: Center(child: Text("Facebook ")),
    );
  }
}
