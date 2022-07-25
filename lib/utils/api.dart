import 'package:flutter_dotenv/flutter_dotenv.dart';

class Network {
  static String? liveUrl = dotenv.env['ONLINE_URL'];
  static String login = "${liveUrl!}auth/login";
  static String register = "${liveUrl!}auth/signup";
}
