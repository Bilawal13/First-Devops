import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No messages yet.'));
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('An error occurred while loading messages.'),
          );
        }
        final chatDocs = snapshot.data!.docs;

        return ListView.builder(
          padding: EdgeInsets.only(bottom: 40, left: 13, right: 13),
          reverse:
              true, // to show the latest message at the bottom of the list and to scroll to the bottom of the list when a new message is added
          itemCount: chatDocs.length,
          itemBuilder: (context, index) {
            final chatMessages = chatDocs[index].data();

            final nextChatMessage = index + 1 < chatDocs.length
                ? chatDocs[index + 1].data()
                : null; // to get the next message in the list and to check if it is from the same user as the current message

            final currentMessageUserId = chatMessages['userId'];
            final nextMessageUserId = nextChatMessage != null
                ? nextChatMessage['userId']
                : null;

            final nextUserIsSame = currentMessageUserId == nextMessageUserId;

            if (nextUserIsSame) {
              return MessageBubble.next(
                message: chatMessages['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            } else {
              return MessageBubble.first(
                userImage: chatMessages['userImage'],
                username: chatMessages['username'],
                message: chatMessages['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            }
          }, // data is a method that returns a map of the document data and we can access the fields of the document using the field names as keys in the map,
        );
      },
    );
  }
}
