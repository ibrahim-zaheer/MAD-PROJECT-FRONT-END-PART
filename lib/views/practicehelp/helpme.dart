import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  final String loggedInUserId;
  final String otherUserId;
  final String collectionName;

  const ChatScreen({
    Key? key,
    required this.loggedInUserId,
    required this.otherUserId,
    required this.collectionName,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Private Chat with User ${widget.otherUserId}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(widget.collectionName)
                  // .where('recipientId', isEqualTo: widget.otherUserId)
                  // .where('senderId', isEqualTo: widget.loggedInUserId)
                  // .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                var messages = snapshot.data!.docs;

                List<Widget> messageWidgets = [];
                for (var message in messages) {
                  var messageText = message['text'];
                  var senderId = message['senderId'];

                  // Display sender's ID on top of the message
                  var senderWidget = Text(
                    'Sender: $senderId',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  );

                  var messageWidget = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      senderWidget,
                      Text(messageText),
                    ],
                  );

                  messageWidgets.add(messageWidget);
                }

                return ListView(
                  reverse: true,
                  children: messageWidgets,
                );
              },
            ),
          ),
          _buildTextComposer(),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              onChanged: (String text) {
                // Handle text changes if needed
              },
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _handleSubmitted(_textController.text);
            },
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      FirebaseFirestore.instance.collection(widget.collectionName).add({
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
        'senderId': widget.loggedInUserId,
        'recipientId': widget.otherUserId,
      });
      _textController.clear();
    }
  }
}
