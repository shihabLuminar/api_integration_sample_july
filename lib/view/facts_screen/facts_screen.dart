import 'package:api_integration_sample/controller/facts_screen_controller.dart';

import 'package:api_integration_sample/view/nationalize_api_screen/nationalise_api_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FactsScreen extends StatelessWidget {
  const FactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final factsScreenState = context.watch<FactsScreenController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NationaliseApiScreen(),
                    ));
              },
              icon: Icon(Icons.arrow_forward))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // refresh facts
          context.read<FactsScreenController>().getRandomFacts();
        },
        backgroundColor: Colors.green.shade100,
        child: Icon(Icons.refresh, color: Colors.green.shade900),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.blueGrey.shade100,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: Text(
                    factsScreenState.factModel?.length.toString() ?? "0",
                    style: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  factsScreenState.factModel?.fact.toString() ?? "Fact",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
