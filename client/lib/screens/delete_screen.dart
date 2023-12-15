import 'dart:convert';
import 'package:client/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:client/widgets/nav_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({Key? key}) : super(key: key);

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final urlController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: SizedBox(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: TextField(
                      controller: urlController,
                      decoration: const InputDecoration(
                        labelText: 'Url',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String url = urlController.text;
                      if (url.isNotEmpty) {
                        submit(url);
                      } else {
                        // Handle empty URL
                        logger.i('URL cannot be empty.');
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> submit(String urlString) async {
    var apiUrl = Uri.http(dotenv.env['BE_URL']!, '/api/delete');
    // Convert data to a JSON format
    var jsonData = jsonEncode({
      'url': urlString,
    });

    var response = await http.delete(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );
    logger.i('Response status: ${response.statusCode}');
  }
}
