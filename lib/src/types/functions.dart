import 'package:bfportalbuilder/core.dart';
import 'package:bfportalbuilder/src/components/components.dart';

import 'literals.dart';

class Message extends FunctionBlock {
  dynamic param1;
  dynamic param2;
  dynamic param3;

  Message(String template, [dynamic this.param1, dynamic this.param2, dynamic this.param3]) : super('Message', [Text(template)]);

  @override
  generate(Context context) {
    if (param1 != null)
      arguments.add(_makeParam(param1));
    if (param2 != null)
      arguments.add(_makeParam(param2));
    if (param3 != null)
      arguments.add(_makeParam(param3));

    return super.generate(context);
  }

  Block _makeParam (dynamic input) {
    if (input is String)
      return Text(input);
    else if (input is int || input is double)
      return Number(input);
    else if (input is Block)
      return input;

    throw Exception("Incompatible type $input used");
  }
}

// User interface
FunctionBlock ClearAllCustomMessages([Block? target]) => FunctionBlock('ClearAllCustomMessages', [target]);
FunctionBlock DisplayGameModeMessage(Message message, [Block? target]) => FunctionBlock('DisplayGameModeMessage', [message, target]);
FunctionBlock DisplayHighlightedWorldLogMessage(Message message, [Block? target]) => FunctionBlock('DisplayHighlightedWorldLogMessage', [message, target]);
FunctionBlock DisplayNotificationMessage(Message message, [Block? target]) => FunctionBlock('DisplayNotificationMessage', [message, target]);

// Logic
FunctionBlock Wait(double ms) => FunctionBlock('Wait', [Number(ms)]);

FunctionBlock And(Block first, Block second) => FunctionBlock('And', [first, second]);
