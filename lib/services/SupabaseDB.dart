import 'package:supabase_flutter/supabase_flutter.dart';

class supabse_DB {
  static supabase_init() async {
    await Supabase.initialize(
      url: 'https://njxqtpmtoslpyhwuatxl.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5qeHF0cG10b3NscHlod3VhdHhsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjkyNDYzNjgsImV4cCI6MjA0NDgyMjM2OH0.THN-5C3-t_Fqu--mCXJjpcSx1wC2LVRhcYtJ8bVD8nU',
    );

    print('Supabase successfully connected 🤑');
  }
}