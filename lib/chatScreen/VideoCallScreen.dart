import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              'assets/pic.png',
              fit: BoxFit.cover,
            )),
            Positioned.fill(
                child: Container(
              color: Colors.black45,
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                Center(
                    child: Hero(
                  tag: 'title',
                  child: Text(
                    'Dr. Charles Richard',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily),
                  ),
                )),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    '12:08',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily),
                  ),
                ),
                Spacer(
                  flex: 12,
                ),
                Divider(
                  color: Colors.white70,
                ),
                Container(
                  height: 120,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.videocam_off,
                            color: Colors.white70,
                            size: 36,
                          ),
                          onPressed: () {}),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Container(
                          height: 30,
                          width: 30,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.mic_off,
                            color: Colors.white70,
                            size: 36,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            Positioned(
                bottom: 145,
                left: 10,
                child: Container(
                  height: size.height * 0.25,
                  width: size.width * 0.4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/pic.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
