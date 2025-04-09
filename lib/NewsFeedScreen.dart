import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔵 Header
          Container(
            padding: EdgeInsets.only(top: 50, bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                'IN THE NEWS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),

          // 📰 News List
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                newsCard(
                  imageUrl: 'https://i.imgur.com/CHxvC9V.jpg',
                  source: 'USA TODAY',
                  date: 'JUN 12, 206',
                  title:
                  'Finding Dory Is a Wonderful, Huge Adventure with Emotion to Spare',
                  iconColor: Colors.blue,
                ),
                newsCard(
                  imageUrl: 'https://i.imgur.com/7QpRp0M.jpg',
                  source: 'POLYCON',
                  date: 'JUN 12, 206',
                  title:
                  'Finding Dory Review: A Heartwarming Sequel Awas with Emotion',
                  iconColor: Colors.redAccent,
                ),
                newsCard(
                  imageUrl: 'https://i.imgur.com/6lHj6Dd.jpg',
                  source: 'FISHYNEWS',
                  date: 'JUN 11, 206',
                  title:
                  'This is the Movie of The Summer! One of the Best Animated This Year!',
                  iconColor: Colors.orange,
                ),
                newsCard(
                  imageUrl: 'https://i.imgur.com/dP3Vz4n.jpg',
                  source: 'REDNEWS',
                  date: 'JUN 12, 206',
                  title:
                  'Finding Dory Is a Wonderful, Huge Adventure with Emotion to Spare',
                  iconColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🧱 News Card Widget
  Widget newsCard({
    required String imageUrl,
    required String source,
    required String date,
    required String title,
    required Color iconColor,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📸 Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          // 📄 Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.circle, color: iconColor, size: 10),
                    SizedBox(width: 6),
                    Text(
                      source,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Text(
                      date,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
