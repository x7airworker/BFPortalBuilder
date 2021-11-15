import 'package:bfportalbuilder/core.dart';

class SimpleComponent extends Component {
  @override
  generate(Context context) {
      return Rule(name: "Test Rule", event: Event.OnGameModeStarted, child: [
        ClearAllCustomMessages(),
        ClearAllCustomMessages()
      ]);
  }
}

void main () {
    createExperience(Experience(generate: SimpleComponent()));
}