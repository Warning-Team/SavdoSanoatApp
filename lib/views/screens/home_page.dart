import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:savdosanoatapp/controllers/request_controller.dart';
import 'package:savdosanoatapp/controllers/user_controller.dart';
import 'package:savdosanoatapp/models/request.dart';
import 'package:savdosanoatapp/models/user.dart';
import 'package:savdosanoatapp/utils/extensions/datetime_reformat.dart';
import 'package:savdosanoatapp/views/screens/add_new_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savdosanoatapp/views/screens/request_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final userController = context.watch<UserController>();
    final requestController = context.read<RequestController>();
    User user = userController.user!;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 55.w,
        leading: Row(
          children: [
            Gap(10.w),
            CircleAvatar(
              radius: 22.w,
              child: ClipOval(
                child: user.imageUrl.isEmpty
                    ? Image.asset(
                        "assets/profile/default.png",
                        fit: BoxFit.cover,
                        width: 44.w,
                        height: 44.w,
                      )
                    : FadeInImage(
                        placeholder: const AssetImage("assets/profile/default.png"),
                        image: NetworkImage(user.imageUrl),
                        fit: BoxFit.cover,
                        width: 44.w,
                        height: 44.w,
                      ),
              ),
            ),
          ],
        ),
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewRequest(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.w, bottom: 10.w),
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white70,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.workPlace,
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "ID: ${user.id}",
                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "${user.name} ${user.surname}",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      wordSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Requests",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: requestController.getRequests(user.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Malumot olishda xato"),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("Malumot mavjud emas"),
                    );
                  }
                  final requests = snapshot.data!.docs;
                  return ListView.builder(
                    padding: EdgeInsets.all(5.w),
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      final request = Request.fromQuery(requests[index]);
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => RequestScreen(
                                  request: request,
                                ),
                              ),
                            );
                          },
                          title: Text(request.cId.toString()),
                          subtitle: Text(request.date.toFormattedDate()),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
