import '../../core.dart';

class Text extends Block {
  String _text;

  Text(String this._text) : super('Text');

  @override
  generate(Context context) {
    genField('TEXT', _text);

    return super.generate(context);
  }
}

class Number extends Block {
  double _value;

  Number(double this._value) : super('Number');

  @override
  generate(Context context) {
    genField('NUM', _value.toString());

    return super.generate(context);
  }
}

class Boolean extends Block {
  static Boolean TRUE = Boolean._(true);
  static Boolean FALSE = Boolean._(false);

  bool _value;

  Boolean._(bool this._value) : super('Boolean');

  @override
  generate(Context context) {
    genField('BOOL', _value.toString().toUpperCase());

    return super.generate(context);
  }
}