import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  final Size size;

  ProfileScreen({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = const Color(0xff0E5D24);
    final bg = const Color(0xffdddddd);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 230,
              color: bg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: size.width,
                    height: 80,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SvgPicture.asset(
                          'assets/settings.svg',
                          color: color,
                          width: 20,
                          height: 20,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white),
                        child: Center(
                          child: Container(
                            height: 95,
                            width: 95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                'assets/pic.png',
                                fit: BoxFit.cover,
                                width: 95,
                                height: 95,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              width: size.width,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dr. Charles Richard',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: color),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'United Kingdom',
                        style: TextStyle(fontSize: 14, color: color),
                      )
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(4.0),
                        backgroundColor: MaterialStateProperty.all(color),
                      ),
                      child: Center(
                        child: Text(
                          "EDIT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.2,
                    color: bg,
                  ),
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CusListTile(
                                svg: 'assets/wallet.svg', title: 'Earnings'),
                            CusListTile(
                                svg: 'assets/history.svg',
                                title: 'Chat History'),
                            CusListTile(
                                svg: 'assets/wallet.svg', title: 'My Bio'),
                            CusListTile(
                                svg: 'assets/wallet.svg',
                                title: 'My Availability Hours'),
                            CusListTile(
                                svg: 'assets/wallet.svg', title: 'Inbox'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CusListTile extends StatelessWidget {
  final String svg;
  final String title;

  CusListTile({Key key, @required this.svg, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = const Color(0xff0E5D24);

    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svg,
            fit: BoxFit.none,
            height: 20,
            width: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 14, color: color),
            ),
          ),
          SvgPicture.asset(
            'assets/right.svg',
            fit: BoxFit.none,
            height: 30,
            width: 30,
          ),
        ],
      ),
    );
  }
}
