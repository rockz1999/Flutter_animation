import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRatingDialogBox extends StatefulWidget {
  final void Function() onpressed;

  const CustomRatingDialogBox({Key key, this.onpressed}) : super(key: key);

  @override
  _CustomRatingDialogBoxState createState() => _CustomRatingDialogBoxState();
}

class _CustomRatingDialogBoxState extends State<CustomRatingDialogBox> {
  int rating = 0;

  changeRating(int value) {
    setState(() {
      rating = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.greenAccent[100],
        ),
        height: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 4,
            ),
            Container(
              height: 200,
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: size.width * 0.25,
                      backgroundColor: Colors.white54,
                      child: Center(
                        child: CircleAvatar(
                          radius: size.width * 0.17,
                          backgroundColor: Colors.white70,
                          child: CircleAvatar(
                            radius: size.width * 0.1,
                            backgroundImage: AssetImage('assets/pic.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      width: size.width * 0.8,
                      child: Center(
                        child: Text(
                          'Dr. Charles Richard',
                          style: TextStyle(
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: size.width - size.width * 0.8,
                    top: 10,
                    child: SvgPicture.asset(
                      'assets/bell.svg',
                      fit: BoxFit.none,
                      color: Colors.green[800],
                    ),
                  )
                ],
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              child: Center(
                  child: Text(
                'Kindly rate Dr. Charles Richard',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: Colors.green[600],
                  fontSize: 14,
                ),
              )),
              width: size.width * 0.6,
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              width: size.width * 0.6,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(
                        rating > 0 ? Icons.star : Icons.star_border,
                        size: 20,
                        color: Colors.green[800],
                      ),
                      onTap: () {
                        changeRating(1);
                      },
                    ),
                    InkWell(
                      child: Icon(rating > 1 ? Icons.star : Icons.star_border,
                          size: 20, color: Colors.green[800]),
                      onTap: () {
                        changeRating(2);
                      },
                    ),
                    InkWell(
                      child: Icon(rating > 2 ? Icons.star : Icons.star_border,
                          size: 20, color: Colors.green[800]),
                      onTap: () {
                        changeRating(3);
                      },
                    ),
                    InkWell(
                      child: Icon(rating > 3 ? Icons.star : Icons.star_border,
                          size: 20, color: Colors.green[800]),
                      onTap: () {
                        changeRating(4);
                      },
                    ),
                    InkWell(
                      child: Icon(rating > 4 ? Icons.star : Icons.star_border,
                          size: 20, color: Colors.green[800]),
                      onTap: () {
                        changeRating(5);
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (rating == 0)
              Spacer(
                flex: 8,
              ),
            if (rating > 0) ...[
              Spacer(
                flex: 2,
              ),
              Divider(
                thickness: 2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (widget.onpressed != null) widget.onpressed();
                },
                child: Text(
                  'YES',
                  style: TextStyle(
                      color: Colors.green[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ],
        ),
      ),
    );
  }
}
