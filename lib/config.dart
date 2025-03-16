import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get apiUrl => dotenv.env['API_URL'] ?? 'http://api.default.com';
  static String get firebaseApiKey =>
      dotenv.get('FIREBASE_API_KEY', fallback: '');
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String get revenueCatApiKey => dotenv.env['REVENUE_CAT_API_KEY'] ?? '';
  static String get oneSignalAppId => dotenv.env['ONE_SIGNAL_APP_ID'] ?? '';
  static String get secretSalt => dotenv.env['SECRET_SALT'] ?? '';
  static String get openAIApiKey => dotenv.env['OPENAI_KEY'] ?? '';
}
