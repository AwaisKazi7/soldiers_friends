import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/common/common_colors.dart';
import 'package:soldiers_friends/common/common_text.dart';
import 'package:soldiers_friends/common/common_text_style.dart';
import 'package:soldiers_friends/common/common_textform.dart';
import 'package:soldiers_friends/commonwidgets/chatdetails_appbar.dart';

class ChatOpenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatDetailAppBar(
        backIcon: AssetImage(CommonAssets.backarrowIcon),
        userImage: AssetImage(CommonAssets.chatuserImage),
        username: 'Jennifer',
        subtitle: 'Your friend today!',
        threeDotIcon: AssetImage(CommonAssets.threedotsIcon),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 6,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: CommonColors.lightGray,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  text: 'Jennifer is waiting for a message',
                  style: CommonTextStyle.splashheadline1,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonText(
                      text: 'from you!',
                      textAlign: TextAlign.center,
                      style: CommonTextStyle.splashheadline1,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              children: [
                ChatBubble(
                  text: 'Jennifer is waiting for a message from you!',
                  isSentByUser: false,
                  time: '8:41 AM',
                  isSeen: true,
                ),
                ChatBubble(
                  text: 'Hey',
                  isSentByUser: true,
                  time: '10 Mins',
                  isSeen: true,
                ),
                ChatBubble(
                  text: 'How are you doing?',
                  isSentByUser: false,
                  time: '1 Mins',
                  isSeen: true,
                ),
                ChatBubble(
                  text: 'Just chilling at my BOQ',
                  isSentByUser: true,
                  time: '1 Mins',
                  isSeen: false,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              iconSize: 20,
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.grey, // Set icon color to grey
                              ),
                              onPressed: () {
                                // Handle camera functionality
                              },
                            ),
                            IconButton(
                              iconSize: 20,
                              icon: Icon(
                                Icons.image,
                                color: Colors.grey, // Set icon color to grey
                              ),
                              onPressed: () {
                                // Handle image selection
                              },
                            ),
                          ],
                        ),
                      ),
                      hintText: 'Write your message here',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey
                              .withOpacity(0.5), // Set border color to grey
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        CommonColors.gradientStartColor,
                        CommonColors.gradientEndColor
                      ])),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // Send the message
                    },
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

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSentByUser;
  final String time;
  final bool isSeen;

  ChatBubble({
    required this.text,
    required this.isSentByUser,
    required this.time,
    required this.isSeen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isSentByUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSentByUser)
            CircleAvatar(
              backgroundImage: AssetImage(
                  CommonAssets.chatuserImage), // Replace with actual image
            ),
          SizedBox(width: 8.0),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              gradient: !isSentByUser
                  ? LinearGradient(
                      colors: [
                        CommonColors.gradientStartColor,
                        CommonColors.gradientEndColor
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: !isSentByUser ? Colors.white : Colors.black,
              borderRadius: BorderRadius.only(
                topLeft:
                    isSentByUser ? Radius.circular(16.0) : Radius.circular(0.0),
                topRight:
                    isSentByUser ? Radius.circular(0.0) : Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: isSentByUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: isSentByUser ? Colors.white : Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
                if (!isSentByUser && isSeen)
                  Icon(
                    Icons.done_all,
                    color: Colors.blue,
                    size: 16.0,
                  )
              ],
            ),
          ),
          if (isSentByUser) SizedBox(width: 8.0),
        ],
      ),
    );
  }
}
