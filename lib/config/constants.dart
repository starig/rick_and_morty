import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final String rickAndMortyApiUrl = dotenv.env['RICK_AND_MORTY_API_URL'] ?? '';
}
