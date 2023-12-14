import 'package:client/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Center(
                child: Text("Hello from delete!"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
