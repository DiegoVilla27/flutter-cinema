import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A class that provides access to environment variables.
///
/// This class retrieves the resources from the environment
/// variables using the `flutter_dotenv` package. These variables are
/// used for configuring network requests within the application.
class Environments {
  static String apiUrl = dotenv.env['API_URL']!;
  static String apiKey = dotenv.env['API_KEY']!;
  static String apiImages = dotenv.env['API_IMAGES']!;
}
