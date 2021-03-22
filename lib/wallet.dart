import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  Size size;

  WalletScreen({Key key, @required this.size}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  AnimationController numberController;
  Animation<double> animationah;
  Animation<double> animationaw;
  Animation<double> animationbh;
  Animation<double> animationbw;
  Animation<double> fadeanimationOp;
  double num = 255.34;
  Animation<double> numberAnim;

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    animationaw = Tween<double>(begin: 20, end: 0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    animationah = Tween<double>(begin: -20, end: 0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    animationbh = Tween<double>(begin: -50, end: 0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    animationbw = Tween<double>(
            begin: 48 +
                20 +
                20 +
                10 +
                ((num.toStringAsFixed(2).length) * 20) -
                ((num.toStringAsFixed(2).length > 5) ? 0.0 : 7.0) -
                widget.size.width,
            end: 0)
        .animate(controller)
          ..addListener(() {
            setState(() {
              // The state that has changed here is the animation object’s value.
            });
          });
    fadeanimationOp = Tween<double>(begin: 0.4, end: 0).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    numberAnim = Tween<double>(begin: 0, end: num).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    start();
  }

  Future<void> start() async {
    await Future.delayed(Duration(seconds: 1));
    controller.forward();
  }

  String getZeros(int num) {
    String a = '';
    for (int i = 0; i < num.toString().length; i++) {
      a = a + '0';
    }
    return a;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = const Color(0xff0E5D24);

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffC9D8CD), Color(0xffDDDDDD)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              Container(
                height: 80,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(animationaw.value, animationah.value),
                        child: Text(
                          "TOTAL EARNED",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: color),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(animationbw.value, animationbh.value),
                        //TODO: code for normal number animation
                        child: Text(
                          "\$" +
                              (numberAnim.value == 0
                                  ? getZeros(num.toInt()) + '.00'
                                  : numberAnim.value.toStringAsFixed(2)),
                          style: TextStyle(fontSize: 42, color: Colors.black),

                          //TODO: Code for number SLider
                          // Row(
                          //   children: [
                          //     Text(
                          //       "\$",
                          //       style: TextStyle(fontSize: 42, color: Colors.black),
                          //     ),
                          //     NumberSlideAnimation(
                          //       number: num == 0 ? '000' : num.toString(),
                          //       duration: Duration(milliseconds: 1700),
                          //       curve: Curves.easeInExpo,
                          //       textStyle:
                          //           TextStyle(fontSize: 42, color: Colors.black),
                          //     ),
                          //     Text(
                          //       ".00",
                          //       style: TextStyle(fontSize: 42, color: Colors.black),
                          //     ),
                          //   ],
                          //),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: color,
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: size.height * 0.08,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Number of consultations this month",
                            style: TextStyle(fontSize: 16, color: color),
                          ),
                          Text(
                            "15",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(animationaw.value, 0),
                    child: Container(
                      padding: const EdgeInsets.only(right: 40.0),
                      height: size.height * 0.08,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 700),
                        curve: Curves.decelerate,
                        opacity: fadeanimationOp.value,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Number of consultations this month",
                                style: TextStyle(fontSize: 16, color: color),
                              ),
                              Text(
                                "15",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: color,
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: size.height * 0.12,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Total number of consultations",
                            style: TextStyle(fontSize: 16, color: color),
                          ),
                          Text(
                            "32",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(animationaw.value, 0),
                    child: Container(
                      padding: const EdgeInsets.only(right: 40.0),
                      height: size.height * 0.12,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 700),
                        curve: Curves.decelerate,
                        opacity: fadeanimationOp.value,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Total number of consultations",
                                style: TextStyle(fontSize: 16, color: color),
                              ),
                              Text(
                                "32",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: color,
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Account Number",
                        style: TextStyle(fontSize: 16, color: color),
                      ),
                      Text(
                        "2207878920",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Bank Name",
                        style: TextStyle(fontSize: 16, color: color),
                      ),
                      Text(
                        "Zenith Bank",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(4.0),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 16),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Center(
                  child: Text(
                    "TRANSACTION HISTORY",
                    style: TextStyle(
                      color: color,
                      fontSize: 18,
                    ),
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
