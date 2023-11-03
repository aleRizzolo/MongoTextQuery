import 'package:flutter/material.dart';

class Insert extends StatelessWidget {
  const Insert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Insert'),
                ),
                const SizedBox(
                  width: 10,
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Retrieve'),
                ),
                const SizedBox(
                  width: 10,
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Delete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
