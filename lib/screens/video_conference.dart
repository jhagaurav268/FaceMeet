import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/Video%20Conference/create_meeting.dart';
import 'package:zoom_clone/Video%20Conference/join_meeting.dart';

class VideoConferenceScreen extends StatefulWidget {
  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen> with SingleTickerProviderStateMixin{

  TabController tabController;

  buildTab(String name){
    return Container(
      width: 150,
      height: 50,
      child: Card(
        child: Center(
          child: Text(name, style: TextStyle(fontSize: 15,color: Colors.black, fontWeight: FontWeight.w700),),
        ),
      ),
    );
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Face Meet",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            buildTab("Join Meetings"),
            buildTab("Create Meetings"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          JoinMeeting(),
          CreateMeeting(),
        ],
      ),
    );
  }
}
