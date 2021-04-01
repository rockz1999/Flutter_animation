import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_work/chatScreen/fromEnum.dart';

class VoiceWidgetInChat extends StatefulWidget {
  final ChatFrom chatFrom;
  final Duration time;
  final DateTime date;

  VoiceWidgetInChat(
      {Key key, this.chatFrom = ChatFrom.self, this.date, @required this.time})
      : super(key: key);

  @override
  _VoiceWidgetInChatState createState() => _VoiceWidgetInChatState();
}

class _VoiceWidgetInChatState extends State<VoiceWidgetInChat>
    with SingleTickerProviderStateMixin {
  final DateTime now = DateTime.now();
  final df = DateFormat('dd/MM/yyyy hh:mm a');
  AnimationController animController;
  ValueNotifier<Animation<double>> fillController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animController =
        AnimationController(duration: widget.time, vsync: this);
    fillController = ValueNotifier(
      Tween<double>(begin: 0, end: 1).animate(animController)
        ..addStatusListener(
          (status) async {
            if (status == AnimationStatus.completed) {
              await Future.delayed(Duration(milliseconds: 500));
              animController.reset();
              await Future.delayed(Duration(milliseconds: 500));
              animController.forward();
            }
          },
        ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animController.stop();
    animController.dispose();
    fillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: widget.chatFrom == ChatFrom.self
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: widget.chatFrom == ChatFrom.other
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.chatFrom == ChatFrom.other)
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Center(
                      child: CircleAvatar(
                        radius: 18,
                        foregroundImage: AssetImage(
                          'assets/pic.png',
                        ),
                      ),
                    )),
              if (widget.chatFrom == ChatFrom.other)
                SizedBox(
                  width: 15,
                ),
              SizedBox(
                width: size.width * 0.65,
                child: Align(
                  alignment: widget.chatFrom == ChatFrom.self
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black54,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),

                              child: ValueListenableBuilder(
                                  valueListenable: fillController.value,
                                  builder: (context, value, child) {
                                    return FractionallySizedBox(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        color: Colors.green,
                                      ),
                                      widthFactor: value,
                                      heightFactor: 1,
                                    );
                                  }),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: SvgPicture.asset('assets/pause.svg'),
                          onPressed: () async {
                            if (animController.isAnimating) {
                              animController.stop();
                            } else {
                              animController.forward();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            margin: widget.chatFrom == ChatFrom.other
                ? const EdgeInsets.only(left: 65)
                : const EdgeInsets.only(right: 5),
            child: Text(
              getDate(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
          )
        ],
      ),
    );
  }

  String getDate() {
    if (widget.date == null) {
      return df.format(now);
    } else {
      return df.format(widget.date);
    }
  }
}
