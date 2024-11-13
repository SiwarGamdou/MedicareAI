import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final generationConfig = GenerationConfig(
    maxOutputTokens: 200, // Maximum response length (words)
  );

  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
        "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.toNamed('/welcome');
          },
        ),
        backgroundColor: const Color(0xFF13315A),
        elevation: 10,
        title: const Padding(
          padding: EdgeInsets.only(left: 80.0),
          child: Text(
            "Chatroom",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC6D3E3),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app_rounded, color: Colors.white),
            onPressed: () {
              Get.toNamed('/logout');
            },
          ),
        ],
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
      messageOptions: const MessageOptions(
        currentUserContainerColor:
            Color(0xFF13315A), // Color for current user's message bubble
        containerColor:
            Color(0xFFC6D3E3), // Color for other users' message bubbles
      ),
    );
  }

  void sendChatMessage(
      ChatMessage chatMessage, GenerationConfig generationConfig) async {
    try {
      final question = chatMessage.text;

      // Update UI with user message
      setState(() {
        messages = [chatMessage, ...messages];
      });

      // Generate response from Gemini
      final responseStream = gemini.streamGenerateContent(question,
          generationConfig: generationConfig);

      await for (final event in responseStream) {
        final response = event.content?.parts?.fold(
                "", (previous, current) => "$previous ${current.text}") ??
            "";

        // Update UI with Gemini response
        setState(() {
          if (messages.isNotEmpty && messages.first.user == geminiUser) {
            // Update existing Gemini message
            final lastMessage = messages.removeAt(0);
            lastMessage.text += response;
            messages.insert(0, lastMessage);
          } else {
            // Add new Gemini message
            messages.insert(
                0,
                ChatMessage(
                    user: geminiUser,
                    createdAt: DateTime.now(),
                    text: response));
          }
        });
      }
    } catch (e) {
      // Handle error
    }
  }

  void _sendMessage(ChatMessage chatMessage) {
    sendChatMessage(chatMessage, generationConfig); // Use default config
  }
}
