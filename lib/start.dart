import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> textAnim;
  Animation<double> textSlideAnim;

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final color = const Color(0xff0E5D24);
  final dateTme = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    textAnim = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 80, end: 0)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 80.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 40)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 60.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 40, end: 0)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 60.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 20)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 40.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 20, end: 0)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 40.0,
      ),
    ]).animate(controller);
    textSlideAnim = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.6, end: 1.4)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 80.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.4, end: 0.7)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 60.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.7, end: 1.3)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 40.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.3, end: 0.8)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 60.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.8, end: 1)
            .chain(CurveTween(curve: Curves.ease)),
        weight: 80.0,
      ),
    ]).animate(controller);
    start();
  }

  void start() async {
    await Future.delayed(Duration(seconds: 1));
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  Size _getSizeOfText(double sWidth) {
    final painter = TextPainter();
    painter.text = TextSpan(
        style: TextStyle(
          fontSize: 42,
        ),
        text: 'What\'s On Your Mind?');
    painter.textDirection = TextDirection.ltr;
    painter.textAlign = TextAlign.left;
    painter.textScaleFactor = 1.0;
    painter.layout();
    return painter.size.width > sWidth
        ? Size(sWidth, painter.size.height * 2)
        : painter.size;
  }

  @override
  Widget build(BuildContext context) {
    final date = '${dateTme.day} ${months[dateTme.month - 1]}, ${dateTme.year}';
    final textSize = _getSizeOfText(MediaQuery.of(context).size.width);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffC9D8CD), Color(0xffDDDDDD)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      color: color,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: color,
                    ),
                    child: Icon(
                      Icons.wysiwyg_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              AnimatedBuilder(
                animation: textAnim,
                builder: (context, child) => Transform.translate(
                  offset: Offset(0, textAnim.value),
                  child: Opacity(
                    opacity: (0.8 -
                            (textAnim.value != 0
                                ? textAnim.value.toDouble() / 100
                                : -0.2))
                        .toDouble(),
                    child: SizedOverflowBox(
                      size: textSize,
                      alignment: Alignment.topCenter,
                      child: ClipRect(
                        clipper: CustomTextClipper(textSize),
                        child: Transform.translate(
                          offset:
                              Offset(0, -textSlideAnim.value * textSize.height),
                          child: Column(
                            children: [
                              Container(
                                height: textSize.height,
                                child: Text(
                                  'What\'s On Your Mind?',
                                  style: TextStyle(
                                    fontSize: 42,
                                  ),
                                ),
                              ),
                              Container(
                                height: textSize.width >
                                        MediaQuery.of(context).size.width
                                    ? textSize.height * 2
                                    : textSize.height,
                                child: Text(
                                  'What\'s On Your Mind?',
                                  style: TextStyle(
                                    fontSize: 42,
                                  ),
                                ),
                              ),
                              Container(
                                height: textSize.width >
                                        MediaQuery.of(context).size.width
                                    ? textSize.height * 2
                                    : textSize.height,
                                child: Text(
                                  'What\'s On Your Mind?',
                                  style: TextStyle(
                                    fontSize: 42,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 16),
                  hintText: 'Type Something here',
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  radius: 30,
                  child: Icon(
                    Icons.check,
                    size: 40,
                    color: color,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextClipper extends CustomClipper<Rect> {
  CustomTextClipper(this.TextSize);

  final Size TextSize;

  @override
  Rect getClip(Size size) {
    return Rect.fromPoints(
        Offset.zero, Offset(TextSize.width, TextSize.height));
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
