import 'package:get/get.dart';
import 'package:medic/chatroom.dart';
import 'package:medic/create_account_page.dart';
import 'package:medic/logout.dart';
import 'package:medic/starting_page.dart';
import 'package:medic/welcome.dart';

import 'login.dart';

List<GetPage> get appRoutes => [
      //Auth screens
      GetPage(name: '/startingPage', page: () => const StartingPage()),
      GetPage(name: '/login', page: () => const LoginPage()),
      GetPage(name: '/welcome', page: () => const WelcomePage()),
      GetPage(name: '/createAccount', page: () => const CreateAccount()),
      GetPage(name: '/Chatroom', page: () => const ChatRoom()),
      GetPage(name: '/logout', page: () => const Logout()),
    ];
