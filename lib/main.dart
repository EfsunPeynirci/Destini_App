import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);
  @override
  State<StoryPage> createState() => _StoryPageState();
}


class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //deceoration: BoxDecoration diyerek arka plana resim koymayı sagladik.
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                  child: Center
                    (
                      child: Text(
                          storyBrain.getStory(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),
              ),
              Expanded(
                flex: 2,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.yellow,
                    ),
                      onPressed: (){
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                      },
                      child: Text(
                          storyBrain.getChoice1(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                        onPressed: (){
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                        },
                        child: Text(
                            storyBrain.getChoice2(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




