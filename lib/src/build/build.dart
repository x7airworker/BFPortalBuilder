import 'package:bfportalbuilder/core.dart';
import 'package:bfportalbuilder/src/build/experience.dart';
import 'package:bfportalbuilder/src/build/options.dart';
import 'package:xml/xml.dart';

export 'context.dart';
export 'experience.dart';

Future<void> createExperience(Experience exp, [Options? options]) async {
  if (options == null)
    options = Options();

  final ctx = Context(options);

  print(generateFromComponent(exp.generate, ctx));
}

String generateFromComponent(Component c, Context ctx) {
    if (c is XmlComponent) {
        var xmlReturn =  c.generate(ctx);
        if (xmlReturn is XmlBuilder) {
            return xmlReturn.buildDocument().toXmlString(pretty: ctx.options.pretty);
        }
    } else if (c is Component) {
        return generateFromComponent(c.generate(ctx), ctx);
    }

    return "";
}