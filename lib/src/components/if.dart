import 'dart:core';

import 'package:bfportalbuilder/core.dart';
import 'package:xml/xml.dart';

class If extends Block {
  Block condition;
  List<Block> then = <Block>[];
  List<Block> _else = <Block>[];

  If(Block this.condition, {required List<Block> this.then}) : super("If");

  @override
  generate(Context context) {
    if (_else.isNotEmpty)
      xml.element("mutation", attributes: {'else': '1'});

    xml.element("value", attributes: {'name': 'VALUE-0'}, nest: (condition.generate(context) as XmlBuilder).buildFragment());

    genStatement("DO", genBlocks(context, then));

    if (_else.isNotEmpty)
      genStatement("ELSE", genBlocks(context, _else));

    return super.generate(context);
  }

  Else(List<Block> blocks) {
      _else = blocks;
      return this;
  }
}