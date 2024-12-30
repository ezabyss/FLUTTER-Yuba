import 'package:flutter/material.dart';
import 'story_brain.dart';

// Main function - This is where the app starts running.
void main() => runApp(Destini());

// Destini App - The main widget for the app.
class Destini extends StatelessWidget {
  const Destini({super.key}); // Constructor with optional key for widget identification.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // Sets the app to use a dark theme.
      home: StoryPage(), // Home screen is the StoryPage widget.
    );
  }
}

// Create a StoryBrain object to manage the story progression.
StoryBrain storyBrain = StoryBrain();

// StoryPage - This widget manages the story display and user interactions.
class StoryPage extends StatefulWidget {
  const StoryPage({super.key});
  @override
  _StoryPageState createState() => _StoryPageState(); // Links to the stateful logic.
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background image for the app.
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpeg"),
            opacity: 0.5,
            fit: BoxFit.cover,  // Ensures the image covers the entire screen.
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(), // Makes the container fill the screen.
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12, // Takes up most of the screen (12 parts out of 16).
                child: Center(
                  child: Text(
                    storyBrain.getStory(), // Displays the current story.
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2, // Choice 1 button, takes up 2 parts of the screen.
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1); // Updates story with choice 1.
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red, // Button color for better visibility.
                    foregroundColor: Colors.white, // Text color.
                  ),
                  child: Text(
                    storyBrain.getChoice1(), // Text for choice 1.
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0), // Space between buttons.
              Expanded(
                flex: 2, // Choice 2 button.
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(), // Controls button visibility.
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2); // Updates story with choice 2.
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue, // Different color for button 2.
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      storyBrain.getChoice2(), // Text for choice 2.
                      style: const TextStyle(fontSize: 20.0),
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
