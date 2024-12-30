import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;  // Keeps track of the current story point.
  int _choiceNumber = 0; // Tracks the user's choice.

  // List of all story segments using the Story class.
  final List<Story> _storyData = [
    Story(
        storyTitle:
        'Yuba sits at his desk, staring at two envelopes: One is an acceptance letter to a university abroad, the other is a local job offer. His family is in the next room, unaware of his internal struggle between earning money abroad or supporting them at home.',
        choice1: 'Accept the offer abroad.',
        choice2: 'Stay and take the local job.'),
    Story(
        storyTitle: 'Yuba lands in a bustling foreign city, full of new opportunities but far from the comfort of home. His mother calls every evening, asking how he is adjusting. The pressure to succeed weighs heavily on him.',
        choice1: 'Focus on work and save money.',
        choice2: 'Consider returning home to be with family.'),
    Story(
        storyTitle:
        'Yuba stays abroad, working tirelessly. While he earns well, the loneliness becomes overwhelming. He feels disconnected from his roots and alienated in a foreign land.',
        choice1: 'Send more money home.',
        choice2: 'Plan a visit back home soon.'),
    Story(
        storyTitle:
        'Yuba decides to stay in his home country and starts working at a local firm. Though the pay is lower, he watches friends succeed abroad and questions his decision, feeling stuck and regretful.',
        choice1: 'Try to grow the family business.',
        choice2: 'Look for higher-paying jobs nearby.'),
    Story(
        storyTitle:
        'Yuba invests in the family business, but progress is slow. His peers drive luxury cars and travel, while he struggles to keep the family afloat, questioning if he sacrificed too much.',
        choice1: 'Stay committed to the family business.',
        choice2: 'Explore other opportunities abroad again.'),
    Story(
        storyTitle:
        'Yuba returns abroad, but his absence strains family relationships. Despite financial success, he feels like an outsider when visiting home, unable to bridge the growing gap.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
        'Yuba remains at home, watching the family business grow at a slow pace. Despite contributing to his family, he feels he may have missed greater opportunities abroad.',
        choice1: 'Restart',
        choice2: '')
  ];

  // Returns the current story's title.
  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  // Returns the text for the first choice.
  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  // Returns the text for the second choice.
  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  // Handles the story progression based on user choice.
  void nextStory(int userChoice) {
    _choiceNumber = userChoice;

    // Logic to determine the next story segment.
    if (_storyNumber == 0 && _choiceNumber == 1) {
      _storyNumber = 1;
    } else if (_storyNumber == 0 && _choiceNumber == 2) {
      _storyNumber = 3;
    } else if (_storyNumber == 1 && _choiceNumber == 1) {
      _storyNumber = 2;
    } else if (_storyNumber == 1 && _choiceNumber == 2) {
      _storyNumber = 3;
    } else if (_storyNumber == 2 && _choiceNumber == 1) {
      _storyNumber = 5;
    } else if (_storyNumber == 2 && _choiceNumber == 2) {
      _storyNumber = 3;
    } else if (_storyNumber == 3 && _choiceNumber == 1) {
      _storyNumber = 4;
    } else if (_storyNumber == 3 && _choiceNumber == 2) {
      _storyNumber = 6;
    } else if (_storyNumber == 4 && _choiceNumber == 1) {
      _storyNumber = 5;
    } else if (_storyNumber == 4 && _choiceNumber == 2) {
      _storyNumber = 6;
    } else if (_storyNumber == 5 || _storyNumber == 6) {
      restart(); // Restarts the story if reaching an end point.
    }
  }

  // Resets the story to the beginning.
  void restart() {
    _storyNumber = 0;
  }

  // Determines if the second button should be visible.
  bool buttonShouldBeVisible() {
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2 || _storyNumber == 3 || _storyNumber == 4) {
      return true; // Show button for early stages.
    } else {
      return false; // Hide button after reaching an end point.
    }
  }
}
