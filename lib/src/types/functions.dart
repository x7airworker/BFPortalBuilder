import 'package:bfportalbuilder/core.dart';
import 'package:bfportalbuilder/src/components/components.dart';

// Literals

class _Text extends Block {
  String _text;

  _Text(String this._text) : super('Text');

  @override
  generate(Context context) {
    genField('TEXT', _text);

    return super.generate(context);
  }
}

class _Number extends Block {
  double _value;

  _Number(double this._value) : super('Number');

  @override
  generate(Context context) {
    genField('NUM', _value.toString());

    return super.generate(context);
  }
}

class Message extends FunctionBlock {
  dynamic param1;
  dynamic param2;
  dynamic param3;

  Message(String template, [dynamic this.param1, dynamic this.param2, dynamic this.param3]) : super('Message', [_Text(template)]);

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
      return _Text(input);
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
FunctionBlock Wait(double ms) => FunctionBlock('Wait', [_Number(ms)]);