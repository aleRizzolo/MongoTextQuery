import 'package:client/screens/add_screen.dart';
import 'package:client/screens/delete_screen.dart';
import 'package:client/screens/get_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              fixedSize: const Size.fromWidth(100),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(5.0), // Adjust the radius as needed
              ),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddScreen()),
            ),
            child: const Text(
              "Add",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          //delete button
          const SizedBox(width: 10),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              fixedSize: const Size.fromWidth(100),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(5.0), // Adjust the radius as needed
              ),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DeleteScreen()),
            ),
            child: const Text(
              "Delete",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
          //get button
          const SizedBox(width: 10),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              fixedSize: const Size.fromWidth(100),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(5.0), // Adjust the radius as needed
              ),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GetScreen()),
            ),
            child: const Text(
              "Get",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
