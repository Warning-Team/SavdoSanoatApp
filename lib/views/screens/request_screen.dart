import 'package:flutter/material.dart';
import 'package:savdosanoatapp/models/request.dart';

// ignore: must_be_immutable
class RequestScreen extends StatefulWidget {
  Request request;
  RequestScreen({super.key, required this.request});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request"),
        centerTitle: true,
      ),
      body: Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "company name",
                              style: TextStyle(fontSize: 17),
                            ),
                            trailing: Text(
                              "Azamat MJR",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "strir",
                              style: TextStyle(fontSize: 17),
                            ),
                            trailing: Text(
                              "12345678912345",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "phone number",
                              style: TextStyle(fontSize: 17),
                            ),
                            trailing: Text(
                              "+998911234567",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    Flexible(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                        ),
                        itemBuilder: (ctx, index) {
                          return Card(
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(
                              "",
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
