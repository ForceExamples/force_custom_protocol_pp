import 'dart:html';
import 'package:force/force_browser.dart';
import 'package:force_custom_protocol_pp/pingpong.dart';

ForceClient fc;
PlayPingPong playPingPong;

main() async {
  fc = new ForceClient(url:"localhost:4040");
  fc.connect();
  
  await fc.onConnected;
  
  playPingPong = new PlayPingPong();
  fc.addProtocol(playPingPong.protocol());
  
  playPingPong.state_of_ping_pong.listen((state) {
    querySelector("#list").appendHtml("<div>$state</div>");
  });
  
  querySelector("#btn")
        ..onClick.listen(broadcast);
}

void  broadcast(MouseEvent event) {
  playPingPong.sendPing();
}
