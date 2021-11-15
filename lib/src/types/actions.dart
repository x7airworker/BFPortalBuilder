import 'package:bfportalbuilder/core.dart';
import 'package:bfportalbuilder/src/components/components.dart';

class Message extends Block {
  final String _str;
  Message(this._str) : super('Message');
}

// User interface
FunctionBlock ClearAllCustomMessages([Block? target]) => FunctionBlock('ClearAllCustomMessages', [target]);
FunctionBlock DisplayGameModeMessage(Message message, [Block? target]) => FunctionBlock('DisplayGameModeMessage', [message, target]);
FunctionBlock DisplayHighlightedWorldLogMessage(Message message, [Block? target]) => FunctionBlock('DisplayHighlightedWorldLogMessage', [message, target]);
FunctionBlock DisplayNotificationMessage(Message message, [Block? target]) => FunctionBlock('DisplayNotificationMessage', [message, target]);