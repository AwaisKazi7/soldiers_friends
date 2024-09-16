import 'package:flutter/material.dart';
import 'package:soldiers_friends/common/common_assets.dart';
import 'package:soldiers_friends/commonwidgets/chatdetails_appbar.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChatDetailAppBar(
        backIcon: AssetImage(CommonAssets.backarrowIcon),
        userImage: AssetImage(CommonAssets.chatuserImage),
        username: 'Jennifer',
        subtitle: 'Your friend today!',
        threeDotIcon: AssetImage(CommonAssets.threedotsIcon),
      ),
      body: Center(
        child: Text('Chat details will be displayed here.'),
      ),
    );
  }
}
