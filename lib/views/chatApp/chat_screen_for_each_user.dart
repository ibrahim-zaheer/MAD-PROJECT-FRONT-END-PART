// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatScreen extends StatefulWidget {
//   final String userId;
//   final String collectionName;

//   const ChatScreen({
//     Key? key,
//     required this.userId,
//     required this.collectionName,
//   }) : super(key: key);

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with User ${widget.userId}'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection(widget.collectionName)
//                   .orderBy('timestamp', descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 }

//                 var messages = snapshot.data!.docs;

//                 List<Widget> messageWidgets = [];
//                 for (var message in messages) {
//                   var messageText = message['text'];
//                   var messageWidget = Text(messageText);
//                   messageWidgets.add(messageWidget);
//                 }

//                 return ListView(
//                   reverse: true,
//                   children: messageWidgets,
//                 );
//               },
//             ),
//           ),
//           _buildTextComposer(),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextComposer() {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _textController,
//               onChanged: (String text) {
//                 // Handle text changes if needed
//               },
//               onSubmitted: _handleSubmitted,
//               decoration: InputDecoration.collapsed(
//                 hintText: 'Send a message',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               _handleSubmitted(_textController.text);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _handleSubmitted(String text) {
//     if (text.isNotEmpty) {
//       FirebaseFirestore.instance.collection(widget.collectionName).add({
//         'text': text,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//       _textController
//           .clear(); // Clear the text input field after sending the message
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:api_demo/views/ninthOneLoginPageButUsedWhenProfileAlreadyCreated.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: Text('Please create or login to your account to chat with me.'),
      actions: [
        TextButton(
          onPressed: () {
            // Replace the next line with your navigation logic
            Navigator.of(context).pop(); // Close the alert dialog
            // Navigate to the login screen or your authentication flow
            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Text('Login'),
        ),
      ],
    );
  }
}

void showCustomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Login();
    },
  );
}

// Example of how to use this widget:
// Call showCustomAlertDialog(context) to display the alert dialog.
