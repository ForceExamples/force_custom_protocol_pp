library pingpong;

import 'package:force/force_common.dart';
import 'dart:async';
import 'dart:convert';

part 'pingpong_dispatcher.dart';
part 'pingpong_package.dart';
part 'pingpong_protocol.dart';

class PlayPingPong {
  
  PingPongProtocol _pingPongProtocol;
  PingPongDispatcher _pingpongDispatcher;
  
  PlayPingPong();
  
  Protocol protocol() {
    _pingpongDispatcher = new PingPongDispatcher();
    _pingPongProtocol = new PingPongProtocol(_pingpongDispatcher);
    return _pingPongProtocol;
  }
  
  void sendPing() => _pingPongProtocol.sendPing();
  
  Stream get state_of_ping_pong => _pingpongDispatcher.state;

}