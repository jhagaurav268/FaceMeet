import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:zoom_clone/variables.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String username = "";
  bool isDataAvailable = false;
  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async{
    DocumentSnapshot userDoc = await userCollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      username = userDoc['username'];
      isDataAvailable = true;
    });
  }

  editProfile() async{
    userCollection.doc(FirebaseAuth.instance.currentUser.uid).update({
      'username' : usernameController.text,
    });
    setState(() {
      username = usernameController.text;
    });
    Navigator.pop(context);
  }

  openEditProfileDialog() async{
    return showDialog(context: context, builder: (context){
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 200,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(left: 30,right: 30),
                child: TextField(
                  controller: usernameController,
                  style: myStyle(18, Colors.black),
                  decoration: InputDecoration(
                    labelText: "Update Username",
                    prefixIcon: Icon(Icons.person),
                    hintStyle: myStyle(20, Colors.grey, FontWeight.w700),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.teal,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: () => editProfile(),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: GradientColors.cherry),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Update Profile",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: isDataAvailable ==false ? Center(child: CircularProgressIndicator(),) : Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.facebookMessenger
                )
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width/2 - 64,
              top: MediaQuery.of(context).size.height/3.1
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              backgroundImage: AssetImage('images/profile.png')
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300,),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: () => openEditProfileDialog(),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: GradientColors.cherry),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: GradientColors.facebookMessenger),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
