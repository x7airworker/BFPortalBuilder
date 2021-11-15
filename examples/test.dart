import 'package:bfportalbuilder/core.dart';

class SimpleComponent extends Component {
  @override
  generate(Context context) {
      return Rule(name: "Test Rule", event: Event.OnPlayerDeployed, child: [
        DisplayNotificationMessage(Message("Hello {}!", context.eventPlayer)),
        Wait(5000),
        ClearAllCustomMessages()
      ]);
  }
}

void main () {
    createExperience(Experience(generate: SimpleComponent()));
}