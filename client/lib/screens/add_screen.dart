import 'dart:convert';
import 'package:client/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:client/widgets/nav_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final titleController = TextEditingController();
  final urlController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    titleController.dispose();
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
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: urlController,
                    decoration: const InputDecoration(
                      labelText: 'Url',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String title = titleController.text;
                      String url = urlController.text;
                      if (title.isNotEmpty && url.isNotEmpty) {
                        submit(title, url);
                      } else {
                        // Handle empty title or URL
                        logger.i('Title or URL cannot be empty.');
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

  Future<void> submit(String title, String urlString) async {
    var apiUrl = Uri.http(dotenv.env['BE_URL']!, '/api/add');
    // Convert data to a JSON format
    var jsonData = jsonEncode({
      'name': title,
      'url': urlString,
    });

    var response = await http.post(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );
    logger.i('Response status: ${response.statusCode}');
  }
}
