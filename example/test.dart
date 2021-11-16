import 'package:bfportalbuilder/core.dart';
import 'package:bfportalbuilder/src/types/literals.dart';

class SimpleComponent extends Component {
  @override
  generate(Context context) {
      return Rule(name: "Test Rule", event: Event.OnPlayerDeployed, child: [
        DisplayNotificationMessage(Message("Hello {}!", context.eventPlayer)),
        Wait(5000),
        If(Boolean.TRUE, then: [
          ClearAllCustomMessages()
        ]).Else([
          DisplayGameModeMessage(Message("Never executed :)"))
        ]),
        While(Boolean.TRUE, then: [
            ClearAllCustomMessages(),
        ])
      ]);
  }
}

void main () {
    createExperience(Experience(generate: SimpleComponent()));
}