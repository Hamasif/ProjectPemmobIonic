import 'package:flutter/material.dart';
import 'package:projectpemmob/models/message_model.dart';
import 'package:projectpemmob/providers/auth_provider.dart';
import 'package:projectpemmob/providers/page_provider.dart';
import 'package:projectpemmob/services/message_service.dart';
import 'package:projectpemmob/widgets/chat_tile.dart';
import 'package:provider/provider.dart';
import '../../theme.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_headset.png',
                width: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Opss no message yet?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'You have never done a transaction',
                style: secondaryTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

<<<<<<< HEAD
    // Widget content() {
    //   return StreamBuilder<List<MessageModel>>(
    //       stream: MessageService()
    //           .getMessagesByUserId(userId: authProvider.user.id),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           if (snapshot.data.length == 0) {
    //             return emptyChat();
    //           }

    //           return Expanded(
    //             child: Container(
    //               width: double.infinity,
    //               color: backgroundColor3,
    //               child: ListView(
    //                 padding: EdgeInsets.symmetric(
    //                   horizontal: defaultMargin,
    //                 ),
    //                 children: [
    //                   ChatTile(snapshot.data[snapshot.data.length - 1]),
    //                 ],
    //               ),
    //             ),
    //           );
    //         } else {
    //           return emptyChat();
    //         }
    //       });
    // }
=======
    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return emptyChat();
              }

              return Expanded(
                child: Container(
                  width: double.infinity,
                  color: backgroundColor3,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    children: [
                      ChatTile(snapshot.data[snapshot.data.length - 1]),
                    ],
                  ),
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }
>>>>>>> ce2e830158d7ef2b9ea28f4a85e34176001af0a6

    return Column(
      children: [
        header(),
        //content(),
      ],
    );
  }
}
