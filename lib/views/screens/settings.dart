import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Settings extends StatelessWidget {
  Settings({super.key});
  List options = [
    "change password",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: options.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    child: ListTile(
                      title: Text(
                        options[index],
                        style: const TextStyle(fontSize: 18),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 15,
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                }),
          )
        ],
      ),
    );
  }
}
