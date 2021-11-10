import 'package:bfportalbuilder/core.dart';

class Block extends XmlComponent {
  String _type;
  Block(this._type);

  /*
    While using this class, note that the super always has to be at the end
   */
  @override
  generate(Context context) {
    var oldXml = xml.buildFragment();
    xml.element('block', nest: oldXml, attributes: {'type': _type});

    return xml;
  }
}