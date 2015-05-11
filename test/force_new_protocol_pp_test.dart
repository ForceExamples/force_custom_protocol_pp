// Copyright (c) 2015, Joris Hermans. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library force_new_protocol_pp_test;

import 'package:force_custom_protocol_pp/pingpong.dart';
import 'package:unittest/unittest.dart';
import 'package:force/force_serverside.dart';
import 'dart:io';
import 'dart:convert';

void main() => defineTests();

void defineTests() {
  HttpRequest req;
    
  group('main tests', () {
    test('test the pingpong protocol', () {
      ForceServer fs = new ForceServer();
      
      PlayPingPong playPingPong = new PlayPingPong();
      fs.addProtocol(playPingPong.protocol());
          
      playPingPong.state_of_ping_pong.listen((state) {
         // print ("coming in $state");
      });
      
    });
  });
}
