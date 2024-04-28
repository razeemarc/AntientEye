import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'conversation.dart';
import 'feedback.dart';

class FeedbackVattaKottai extends StatefulWidget {
  @override
  _FeedbackVattaKottaiState createState() => _FeedbackVattaKottaiState();
}

class _FeedbackVattaKottaiState extends State<FeedbackVattaKottai> {
  List<Conversation> characterItems =[];

  @override
  void initState() {
    fetchCharacterVoices();
    super.initState();

  }
  fetchCharacterVoices() async{
    var records =await FirebaseFirestore.instance.collection('VattaKottaiFeedback').get();
    mapRecords(records);
  }
  mapRecords(QuerySnapshot<Map<String,dynamic>> records){
    var _list=records.docs.map(
          (conversation)=>Conversation(
        id:conversation.id,
        username:conversation['username'],
        place:conversation['place'],
        rate:conversation['rate'],
        comment:conversation['comment'],
      ),
    ).toList();
    setState(() {
      characterItems=_list;
    });

  }
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          title: Text(
            "Feedback",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),

        body: ListView.builder(
          itemCount: characterItems.length,
          itemBuilder: (context, index) {
            String username = characterItems[index].username;
            String place = characterItems[index].place;
            String rate = characterItems[index].rate;
            String comment = characterItems[index].comment;
            return Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 5), // Adjust padding as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Feedback boxes
                  Container(
                    margin: EdgeInsets.only(bottom: 1),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF89A4B8),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: $username', style: TextStyle(fontSize: 20, color:Colors.white)),
                        Text('Place: $place', style: TextStyle(fontSize: 20, color:Colors.white)),
                        Text('Rate: $rate', style: TextStyle(fontSize: 20, color:Colors.white)),
                        Text('Comment: $comment', style: TextStyle(fontSize: 20, color:Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        floatingActionButton: Positioned(
          bottom: 20.0,
          right: 20.0,
          child: FloatingActionButton(
            onPressed: () {
              // Navigate to the next page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RatingScreen()),
              );
            },
            backgroundColor: Color(0xFFE1A308),
            child: Icon(Icons.edit, color: Colors.white),
          ),
        ),

      ),
    );
  }
}



