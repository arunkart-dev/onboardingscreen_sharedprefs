import 'package:flutter/material.dart';
import 'package:onboardingscreen_sharedprefs/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Future<void> completeOnboarding(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboardingSeen', true);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const HomeScreen()),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          buildpage(
            context, 
            title: 'Welcome !',
             content: 'This is the first page of onboarding'
             ),
          buildpage(
            context,
           title: 'Second page',
            content: 'Second page of onboaring',
            islast: true
            )   
        ],
      ),
    );
  }
  Widget buildpage(
  BuildContext context, {
  required String title,
  required String content,
  bool islast = false,
}) {
  return Container(
    padding: EdgeInsets.all(32),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          content,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        if(islast)
        ElevatedButton(
          onPressed: () =>  completeOnboarding(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            minimumSize: Size(200, 40)
          ),
           child: Text('Done')
           )
      ],
    ),
  );
}

}

