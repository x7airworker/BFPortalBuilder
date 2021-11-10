import 'package:bfportalbuilder/core.dart';
import 'package:xml/xml.dart';

class FunctionCallBlock extends Block {
  int _counter = 0;

  FunctionCallBlock(String type) : super(type);

  pushArgument (Context context, Block block) {
      xml.element('value', nest: (block.generate(context) as XmlBuilder).buildFragment(), attributes: {'name': "VALUE-$_counter"});
      _counter++;
  }
}