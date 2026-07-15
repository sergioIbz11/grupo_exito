import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseUrl {
  static String apiKey = dotenv.get("BASE_URL", fallback: "No URL");
}
