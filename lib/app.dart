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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Score List')),
      body: StreamBuilder(
        stream: db.collection('football').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState  == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>> querySnapshot = snapshot
                .data! as QuerySnapshot<Map<String, dynamic>>;
            _prepareScoreList(querySnapshot);
            /*for(QueryDocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs){
              _footballScoreList.add(FootballScore.fromJson(doc.data(), doc.id));
            }*/

            return ListView.builder(
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
                    backgroundColor: score.isRunning ? Colors.green : Colors
                        .grey,
                    radius: 8,
                  ),
                );
              },
            );
          }
          return SizedBox();
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: _addMatchScore,
        child: Icon(Icons.refresh_outlined)),
    );
  }
  void _addMatchScore(){FootballScore score = FootballScore(
      team1: 'Bangladesh',
      team2: 'England',
      team1_Score: 2,
      team2_Score: 7,
      winnerTeam: '',
      isRunning: true,
      matchName: 'BanvsEng',
    );
    db.collection('football').doc(score.matchName).set(score.toJson());
    //db.collection('football').doc(score.matchName).update(score.toJson());
  }

  void _prepareScoreList(QuerySnapshot<Map<String, dynamic>> querySnapshot) {
    _footballScoreList.clear();
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc
        in querySnapshot.docs) {
      _footballScoreList.add(FootballScore.fromJson(doc.data(), doc.id));
    }
  }
}