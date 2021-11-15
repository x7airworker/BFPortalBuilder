import 'package:bfportalbuilder/core.dart';
import 'package:xml/xml.dart';

class FunctionBlock extends Block {
    List<Block?> arguments = <Block?>[];

    FunctionBlock(String name, this.arguments) : super(name);

    @override
    generate(Context context) {
        var count = 0;

        arguments.forEach((element) {
            if (element != null) {
                xml.element('value', nest: (element.generate(context) as XmlBuilder).buildFragment(), attributes: {'name': "VALUE-$count"});
                count++;
            }
        });

        return super.generate(context);
    }
}