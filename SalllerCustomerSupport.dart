import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Salllercustomersupport extends StatefulWidget {
  const Salllercustomersupport({Key? key}) : super(key: key);

  @override
  State<Salllercustomersupport> createState() => _SalllercustomersupportState();
}

class _SalllercustomersupportState extends State<Salllercustomersupport> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _handleSubmitted(String text) {
    _controller.clear();
    setState(() {
      _messages.insert(0, ChatMessage(text: text, isUserMessage: true));
      _getBotResponse(text);
    });
  }

  void _getBotResponse(String userMessage) {
    // You can replace this with your chatbot logic
    String botMessage = "This is a response to: $userMessage";
    setState(() {
      _messages.insert(0, ChatMessage(text: botMessage, isUserMessage: false));
    });
  }

  void _clearChat() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Clear Chat'),
        content: Text('Are you sure you want to clear the chat?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              setState(() {
                _messages.clear(); // Clear chat messages
              });
            },
            child: Text('Clear'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Support'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[

          IconButton(

            icon: Icon(Icons.delete_forever,color: Colors.white,),
            onPressed: _clearChat,
          ),

        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (context, index) {
                return _messages[index];
              },
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: _buildTextComposer(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18.0),
            child: TextField(
              controller: _controller,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send, color: Colors.deepPurple),
          onPressed: () => _handleSubmitted(_controller.text),
        ),
      ],
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
        isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isUserMessage ? Colors.deepPurple : Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isUserMessage ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
