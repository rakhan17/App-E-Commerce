// lib/main.dart

import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/account_page.dart';
import 'pages/change_password_page.dart';
import 'pages/edit_profile_page.dart';
import 'pages/cart_page.dart'; // Import halaman cart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primus Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Tema utama aplikasi
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,

        // Mengatur warna utama (misal: untuk AppBar jika ada)
        primaryColor: Colors.white,
        
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),

        // Mengatur warna aksen (misal: untuk beberapa widget aktif)
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.white,
          background: Colors.black,
          surface: Color(0xFF1F1F1F), // Warna untuk Card
        ),

        // Mengatur warna kursor dan seleksi teks
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.grey,
          selectionHandleColor: Colors.white,
        ),

        // Mengatur tema untuk input decoration
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey[400]),
          hintStyle: TextStyle(color: Colors.grey[600]),
          prefixIconColor: Colors.grey[400],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade700),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white),
          ),
          errorStyle: const TextStyle(color: Colors.redAccent),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
        ),
      ),
      // Menggunakan initialRoute dan routes untuk navigasi yang lebih baik
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        // Anda bisa meneruskan argumen seperti email jika diperlukan
        '/account': (context) {
            final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
            final email = args?['email'] ?? 'default@example.com';
            return AccountPage(email: email);
        },
        '/edit_profile': (context) {
            final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
            final name = args?['name'] ?? 'User';
            final email = args?['email'] ?? 'default@example.com';
            return EditProfilePage(initialName: name, initialEmail: email);
        },
        '/change_password': (context) => const ChangePasswordPage(),
        '/cart': (context) => const CartPage(), // Tambahkan route untuk CartPage
      },
    );
  }
}
