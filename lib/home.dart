import 'package:flutter/material.dart';
import 'package:progress_tracker/progress_tracker.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Status> statusList = [
    Status(name: 'ORDER', icon: Icons.shopping_bag),
    Status(name: 'SHIP', icon: Icons.local_shipping),
    Status(name:'Out for Delivery',icon:Icons.pending_actions_outlined),
    Status(name: 'DONE', icon: Icons.check_circle),
  ];
  int index = 0;

  void nextButton() {
    setState(() {
      index++;
      statusList[index].active = true;
    });
  }
  void prevButton() {
    setState(() {
      index--;
      statusList[index].active = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Example Progress Tracker'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProgressTracker(
                currentIndex: index,
                statusList: statusList,
                activeColor: Colors
                    .green,
                inActiveColor: Colors
                    .grey,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: index != statusList.length - 1 ? nextButton : null,
              child: const Text('NEXT'),
            ),
            ElevatedButton(
              onPressed: index != 0 ? prevButton : null,
              child: const Text('PREV'),
            )
          ],
        ),

    );
  }
}
