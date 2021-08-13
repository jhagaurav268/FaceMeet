import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zoom_clone/authentication/navigate_auth_screen.dart';
import 'package:zoom_clone/variables.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      //pages: pages, onDone: onDone, done: done
      onDone: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
      },
      onSkip: (){},
      showSkipButton: true,
      skip: const Icon(Icons.skip_next,size: 45,),
      next: const Icon(Icons.arrow_forward),
      done: Text("Done",style: myStyle(20,Colors.black),),

      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Welcome to FaceMeet, the best video conference app",
          decoration: PageDecoration(
            bodyTextStyle: myStyle(20, Colors.black),
            titleTextStyle: myStyle(20, Colors.black),
          ),
          image: Center(
            child: Image.asset(
              'images/welcome.png',
              height: 200,
            ),
          ),
        ),
        PageViewModel(
          title: "Join or Start Meetings",
          body: "Excellent Interface and UI. Join or Start meetings in real time",
          decoration: PageDecoration(
            bodyTextStyle: myStyle(20, Colors.black),
            titleTextStyle: myStyle(20, Colors.black),
          ),
          image: Center(
            child: Image.asset(
              'images/conference.png',
              height: 200,
            ),
          ),
        ),
        PageViewModel(
          title: "Security",
          body: "Your security is important to us. Our servers are secure and reliable",
          decoration: PageDecoration(
            bodyTextStyle: myStyle(20, Colors.black),
            titleTextStyle: myStyle(20, Colors.black),
          ),
          image: Center(
            child: Image.asset(
              'images/secure.png',
              height: 200,
            ),
          ),
        ),
      ],
    );
  }
}
