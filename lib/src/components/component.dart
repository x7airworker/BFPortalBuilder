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
    var generated = List.of(blocks
        .map((c) => c.generate(context))
        .map((r) => r is XmlBuilder ? r.buildFragment() : throw Exception("Type should be XmlBuilder!")));

    var rootElement = generated.removeAt(0);

    generated = List.of(generated.map((x) {
      var builder = XmlBuilder();
      builder.element("next", nest: x);
      return builder.buildFragment();
    }));

    generated.fold(rootElement.firstChild, (previousValue, element) {
      (previousValue as XmlNode).children.add(element);
      return previousValue.findElements("next").last.firstChild;
    }); // hacky ik

    return rootElement;
  }
}