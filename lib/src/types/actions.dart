import 'package:bfportalbuilder/core.dart';

class Message extends Block {
  final String _str;
  Message(this._str) : super('Message');
}

class DisplayNotificationMessage extends FunctionCallBlock {
  final Message _message;
  final Block _target;

  DisplayNotificationMessage(this._message, this._target) : super('ShowNotificationMessage');

  @override
  generate(Context context) {
    pushArgument(context, _message);
    pushArgument(context, _target);

    return super.generate(context);
  }
}