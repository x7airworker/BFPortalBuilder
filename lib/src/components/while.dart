import 'package:bfportalbuilder/core.dart';
import 'package:xml/xml.dart';

class While extends Block {
  Block condition;
  List<Block> then = <Block>[];

  While(Block this.condition, {required List<Block> this.then}) : super('While');

  @override
  generate(Context context) {
    xml.element("value", attributes: {'name': 'VALUE-0'}, nest: (condition.generate(context) as XmlBuilder).buildFragment());

    genStatement("DO", genBlocks(context, then));

    return super.generate(context);
  }
}