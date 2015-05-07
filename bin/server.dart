library aproducthuntdart;

import 'package:force/force_serverside.dart';
import 'package:force_custom_protocol_pp/pingpong.dart';
import 'dart:math';
import 'dart:async';

main() async {
  // You can also use a memory implementation here, just switch the CargoMode to MEMORY
  
  // Create a force server
  ForceServer fs = new ForceServer(port: 4040, 
                                 clientFiles: '../build/web/');
    
  // Setup logger
  fs.setupConsoleLog();
  
  // wait until our forceserver is been started and our connection with the persistent layer is done!
  await fs.start();
  // Tell Force what the start page is!
  fs.server.static("/", "index.html");
  
  PlayPingPong playPingPong = new PlayPingPong();
  fs.addProtocol(playPingPong.protocol());
  
  playPingPong.state_of_ping_pong.listen((state) {
    print ("coming in $state");
  });
}

