import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:state_management/score.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LiveScoreListScreen());
  }
}

class LiveScoreListScreen extends StatefulWidget {
  const LiveScoreListScreen({super.key});

  @override
  State<LiveScoreListScreen> createState() => _LiveScoreListScreenState();
}

class _LiveScoreListScreenState extends State<LiveScoreListScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final List<FootballScore> _footballScoreList = [];
  bool _getFootScoreInProgress = false;

  @override
  void initState() {
    super.initState();
    _getLiveScoreList();
  }

  Future<void> _getLiveScoreList() async {
    _getFootScoreInProgress = true;
    _footballScoreList.clear();
    QuerySnapshot<Map<String, dynamic>> snapshot = await db.collection('football').get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      //print(doc.data());
      _footballScoreList.add(FootballScore.fromJson(doc.data(), doc.id));
    }
    _getFootScoreInProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Score List')),
      body: Visibility(
        visible: _getFootScoreInProgress == false,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: _footballScoreList.length,
          itemBuilder: (context, index) {
            FootballScore score = _footballScoreList[index];
            return ListTile(
              title: Text(score.matchName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${score.team1} vs ${score.team2}'),
                  if (score.isRunning == false)
                    Text('Winner team is ${score.winnerTeam}'),
                ],
              ),
              trailing: Text('${score.team1_Score}-${score.team2_Score}'),
              leading: CircleAvatar(
                backgroundColor: score.isRunning ? Colors.green : Colors.grey,
                radius: 8,
              ),
            );
          },
        ),
      ),
    );
  }
}