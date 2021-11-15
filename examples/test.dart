import 'package:bfportalbuilder/core.dart';

class SimpleComponent extends Component {
  @override
  generate(Context context) {
      return Rule(name: "Test Rule", event: Event.OnGameModeStarted, child: [
        ClearAllCustomMessages(),
        ClearAllCustomMessages(),
        DisplayNotificationMessage(Message("bruh")),
        ClearAllCustomMessages()
      ]);
  }
}

void main () {
    createExperience(Experience(generate: SimpleComponent()));
}