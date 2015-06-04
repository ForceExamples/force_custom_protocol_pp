// Copyright (c) 2015, Joris Hermans. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library force_new_protocol_pp_test;

import 'package:force_custom_protocol_pp/pingpong.dart';
import 'package:force/test.dart';
import 'package:unittest/unittest.dart';
import 'package:force/force_serverside.dart';
import 'dart:convert';

void main() => defineTests();

void defineTests() {
    
  group('main tests', () {
    test('test the pingpong protocol', () async {
      ForceServer fs = new ForceServer();
      TestForce tf = new TestForce(fs);
      TestForceClient fc = tf.forceClient;
      fc.connect();
      
      PlayPingPong playPingPong = new PlayPingPong();
      fs.addProtocol(playPingPong.protocol());
      
      PlayPingPong playPingPongClient = new PlayPingPong();
      // var client_state = await playPingPongClient.state_of_ping_pong.first;
      // expect(client_state, 'PONG');
      fc.addProtocol(playPingPongClient.protocol());
      
      playPingPongClient.sendPing();
     
      var server_state = await playPingPong.state_of_ping_pong.first;
           expect(server_state, 'PING');
      
    });
  });
}
