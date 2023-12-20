import 'dart:convert';
import 'package:client/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:client/widgets/nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({Key? key}) : super(key: key);

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  final titleController = TextEditingController();
  Uri url = Uri.https("");
  List<Map<String, dynamic>> data = [];

  @override
  void dispose() {
    titleController.dispose();
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
                  ElevatedButton(
                    onPressed: () {
                      String title = titleController.text;
                      if (title.isNotEmpty) {
                        submit(title);
                      } else {
                        logger.i('Title cannot be empty.');
                      }
                    },
                    child: const Text('Submit'),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data[index]['name']),
                          subtitle: GestureDetector(
                            onTap: () {
                              url = Uri.parse(data[index]['link']);
                              _launchUrl(url);
                            },
                            child: Text(
                              data[index]['link'],
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> submit(String titleString) async {
    var apiUrl =
        Uri.http(dotenv.env['BE_URL']!, '/api/get', {'name': titleString});

    var response = await http.get(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      dynamic jsonResponse = json.decode(response.body);
      titleController.clear();

      if (jsonResponse['success'] == true) {
        dynamic jsonData = jsonResponse['data'];

        if (jsonData is Iterable) {
          List<Map<String, dynamic>> resultList = [];
          for (var item in jsonData) {
            resultList.add({
              'name': item['name'],
              'link': item['url'],
            });
          }
          setState(() {
            data = resultList;
          });
        } else {
          logger.i('Invalid data format: $jsonData');
        }
      } else {
        logger.i('API request was not successful. Response: $jsonResponse');
      }
    } else {
      logger.i('Error: ${response.statusCode}');
    }
  }

  Future<void> _launchUrl(Uri url) async {
    await launchUrl(url);
  }
}
