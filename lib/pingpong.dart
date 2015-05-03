library pingpong;

import 'package:force/force_common.dart';
import 'dart:async';
import 'dart:convert';

part 'pingpong_dispatcher.dart';
part 'pingpong_package.dart';
part 'pingpong_protocol.dart';

class PlayPingPong {
  
  PingPongDispatcher _pingpongDispatcher;
  
  SendablePackage sendablePackage;
  
  PlayPingPong(this.sendablePackage);
  
  Protocol protocol() {
    _pingpongDispatcher = new PingPongDispatcher(sendablePackage);
    PingPongProtocol pingPongProtocol = new PingPongProtocol(_pingpongDispatcher);
    return pingPongProtocol;
  }
  
  void sendPing() {
    sendablePackage.sendPackage(new PingPongPackage(PingPongPackage.PING));
  }
  
  Stream get state_of_ping_pong => _pingpongDispatcher.state;

}