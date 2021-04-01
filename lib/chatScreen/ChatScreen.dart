import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_work/chatScreen/CustomDialog.dart';
import 'package:test_work/chatScreen/fromEnum.dart';
import 'package:test_work/chatScreen/photoInChat.dart';
import 'package:test_work/chatScreen/textWidget.dart';
import 'package:test_work/chatScreen/voiceMessage.dart';
import 'package:test_work/core/valueListenableBuilder2.dart';

class ChatScreenPage extends StatefulWidget {
  @override
  _ChatScreenPageState createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> heightOfText = ValueNotifier<double>(40.00);
  final key = GlobalKey();
  ValueNotifier<bool> participants = ValueNotifier(false);
  AnimationController animController;
  ValueListenable<Animation<double>> participantsAnim;

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  final List<String> menuList = [
    'Invite',
    'Participants',
    'Health Profile',
    'End Session'
  ];

  final List<PartipantInfo> participantsInfo = [
    PartipantInfo(name: 'Malik Sanusi', isOnline: true),
    PartipantInfo(name: 'Frank Martial'),
    PartipantInfo(
      name: 'Dr. Charles Richard',
      isOnline: true,
    ),
    PartipantInfo(
      name: 'Dr. Charles Richardas',
      isOnline: true,
    ),
    PartipantInfo(
      name: 'Dr. Bharles Richard',
      isOnline: true,
    )
  ];

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    participantsAnim = ValueNotifier(
        Tween<double>(begin: 6.0, end: 1.5).animate(animController));
  }

  @override
  void dispose() {
    animController.stop();
    animController.dispose();
    super.dispose();
  }

  void showInviteMenu(BuildContext context, Size size) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(40),
        height: size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Participant\'s\nUsername',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(
              flex: 2,
            ),
            TextField(
              style: TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              width: size.width,
              child: Center(
                child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: size.width * 0.3, vertical: 20)),
                    ),
                    child: Text(
                      'Invite',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(20.0)),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    double textfieldWidth;
    final textSize = _textSize(
      'a',
      TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: Image.asset(
              'assets/image.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.black26,
                  Colors.black12,
                ])),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                color: Colors.transparent,
                padding: const EdgeInsets.only(left: 8),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {}),
                    Stack(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 22,
                            child: Center(
                              child: CircleAvatar(
                                radius: 20,
                                foregroundImage: AssetImage(
                                  'assets/pic.png',
                                ),
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                              width: 12,
                              height: 12,
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Charles Richard',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '60:00',
                          style: TextStyle(
                              color: Colors.amberAccent, fontSize: 16),
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: SvgPicture.asset(
                          'assets/callChat.svg',
                          fit: BoxFit.none,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: SvgPicture.asset(
                        'assets/video.svg',
                        fit: BoxFit.none,
                      ),
                    ),
                    PopupMenuButton(
                        child: Icon(
                          Icons.arrow_right_sharp,
                          size: 26,
                        ),
                        onSelected: (value) async {
                          switch (value) {
                            case 0:
                              print('invite');
                              //TODO: invite menu
                              showInviteMenu(context, size);
                              break;
                            case 1:
                              print('participant');
                              //TODO: participant menu button
                              participants.value = true;
                              await Future.delayed(Duration(milliseconds: 500));
                              animController.forward();
                              break;
                            case 2:
                              //TODO: health menu button
                              print('health');
                              break;
                            case 3:
                              //TODO: End Session menu button
                              showDialog(
                                context: context,
                                builder: (context) => CustomDialogBox(
                                  onpressed: () {
                                    print('YES');
                                  },
                                ),
                              );
                              print('end');
                              break;
                          }
                        },
                        itemBuilder: (context) => menuList
                            .map(
                              (e) => PopupMenuItem(
                                value: menuList.indexOf(e),
                                height: 40,
                                child: Text('$e'),
                              ),
                            )
                            .toList()),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidgetInChat(
                          message:
                              'THis is someone I know and it is great to know someone wafkaf asfjhka',
                        ),
                        TextWidgetInChat(
                          message:
                              'THis is someone I know and it is great to know someone wafkaf asfjhka',
                          chatFrom: ChatFrom.other,
                        ),
                        TextWidgetInChat(
                          message: 'THis is someone Ijhka',
                          chatFrom: ChatFrom.other,
                        ),
                        PhotoWidgetInChat(
                          url: 'assets/pic.png',
                          date: DateTime.now(),
                        ),
                        PhotoWidgetInChat(
                          url: 'assets/image.png',
                          date: DateTime.now(),
                          chatFrom: ChatFrom.other,
                        ),
                        VoiceWidgetInChat(
                          time: Duration(seconds: 90),
                          chatFrom: ChatFrom.other,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                valueListenable: heightOfText,
                builder: (context, value, child) => AnimatedContainer(
                  width: size.width * 0.9,
                  height: value,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset('assets/attach.svg'),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextField(
                            key: key,
                            scrollPhysics: BouncingScrollPhysics(),
                            decoration: InputDecoration(
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Type Something...",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            minLines: null,
                            maxLines: null,
                            expands: true,
                            onChanged: (String e) {
                              if (textfieldWidth == null) {
                                textfieldWidth = getWidth();
                              }
                              double cal = e.length * textSize.width;
                              int numlines = (cal / textfieldWidth).ceil();
                              if (numlines != heightOfText.value / 40 &&
                                  numlines > 1) {
                                double cal = 40 + (numlines * 8).toDouble();
                                if (cal > 90) {
                                  heightOfText.value = 90;
                                } else {
                                  heightOfText.value =
                                      cal == 50.00 ? 40.00 : cal;
                                }
                              } else if (numlines == 1) {
                                heightOfText.value = 40.00;
                              }
                            }),
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/microphone.svg'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
          ValueListenableBuilder2(
            participants,
            participantsAnim.value,
            builder: (context, value, animValue, child) => value
                ? GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      animController.reverse();
                      await Future.delayed(Duration(milliseconds: 1100));
                      participants.value = false;
                    },
                    child: Container(
                      height: size.height,
                      width: size.width,
                      child: Align(
                        alignment: Alignment(animValue, -0.6),
                        child: SizedBox(
                          height: participantsInfo.length > 3
                              ? 250.toDouble()
                              : (70 * participantsInfo.length).toDouble(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black,
                            ),
                            width: size.width * 0.7,
                            padding: EdgeInsets.only(
                                bottom: 12,
                                top: 12,
                                left: 12,
                                right: size.width * 0.08),
                            child: participantsInfo.length < 4
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: participantsInfo
                                        .map(
                                          (e) => Container(
                                            height: 50,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius: 22,
                                                        child: Center(
                                                          child: CircleAvatar(
                                                            radius: 20,
                                                            foregroundImage:
                                                                AssetImage(
                                                              e.imageUrl,
                                                            ),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        bottom: 0,
                                                        right: 0,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: e.isOnline
                                                                  ? Colors.green
                                                                  : Colors.grey,
                                                              shape: BoxShape
                                                                  .circle),
                                                          width: 12,
                                                          height: 12,
                                                        ))
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  e.name,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  )
                                : SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: participantsInfo
                                          .map((e) => Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 5),
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        CircleAvatar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            radius: 22,
                                                            child: Center(
                                                              child:
                                                                  CircleAvatar(
                                                                radius: 20,
                                                                foregroundImage:
                                                                    AssetImage(
                                                                  e.imageUrl,
                                                                ),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            bottom: 0,
                                                            right: 0,
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: e.isOnline
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .grey,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              width: 12,
                                                              height: 12,
                                                            ))
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      e.name,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ))
                : Container(),
          ),
        ],
      )),
    );
  }

  double getWidth() {
    return key.currentState.context.size.width;
  }
}

class PartipantInfo {
  final String imageUrl;
  final String name;
  bool isOnline;

  PartipantInfo(
      {this.imageUrl = 'assets/pic.png',
      this.name = 'xyz',
      this.isOnline = false});
}
