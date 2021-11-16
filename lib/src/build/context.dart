import 'package:bfportalbuilder/core.dart';
import 'package:bfportalbuilder/src/build/options.dart';

class Context {
    final Block eventPlayer = Block("EventPlayer");
    final Block eventOtherPlayer = Block("EventOtherPlayer");
    final Block eventTeam = Block("EventTeam");
    Options options;


    Context(this.options);
}