import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_work/chatScreen/fromEnum.dart';

class PhotoWidgetInChat extends StatelessWidget {
  final ChatFrom chatFrom;
  final String url;
  final DateTime date;
  final DateTime now = DateTime.now();
  final df = DateFormat('dd/MM/yyyy hh:mm a');

  PhotoWidgetInChat(
      {Key key, this.chatFrom = ChatFrom.self, this.date, @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: chatFrom == ChatFrom.self
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: chatFrom == ChatFrom.other
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (chatFrom == ChatFrom.other)
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
                    )
                ),
              if (chatFrom == ChatFrom.other)
                SizedBox(
                  width: 15,
                ),
              SizedBox(
                width: size.width * 0.65,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    url,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            margin: chatFrom == ChatFrom.other
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
    if (date == null) {
      return df.format(now);
    } else {
      return df.format(date);
    }
  }
}
