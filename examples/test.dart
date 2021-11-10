import 'package:bfportalbuilder/core.dart';

class SimpleComponent extends Component {
  @override
  generate(Context context) {
      return Rule(name: "Test Rule", event: Event.OnGameModeStarted, child: [
          DisplayNotificationMessage(Message("Hello World!"), context.eventPlayer)
      ]);
  }
}

void main () {
    createExperience(Experience(generate: SimpleComponent()));
}