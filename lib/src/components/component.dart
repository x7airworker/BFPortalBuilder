import 'package:bfportalbuilder/src/build/context.dart';
import 'package:xml/xml.dart';

import '../../core.dart';

abstract class Component {
  dynamic generate(Context context);
}

abstract class XmlComponent extends Component {
  XmlBuilder xml = XmlBuilder();

  genField(String name, String value) {
      xml.element('field', nest: () {
          xml.attribute('name', name);
          xml.text(value);
      });
  }

  genStatement(String name, Object? nest) {
      xml.element('statement', nest: nest, attributes: {'name': name});
  }

  /**
   * This will resolve <next> elements in blocks
   */
  genBlocks(Context context, List<Component> blocks) {
    var frag = xml.buildFragment();

    var generated = blocks.map((c) => c.generate(context)).map((r) => r is XmlBuilder ? r.buildFragment() : r);

    return generated;
  }
}