import 'package:bfportalbuilder/core.dart';
import 'package:bfportalbuilder/src/build/options.dart';

class Context {
    Block eventPlayer = Block("EventPlayer");
    Block eventOtherPlayer = Block("EventOtherPlayer");
    Block eventTeam = Block("EventTeam");
    Options options;


    Context(this.options);
}