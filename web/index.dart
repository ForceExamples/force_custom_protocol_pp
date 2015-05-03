import 'dart:html';
import 'package:force/force_browser.dart';
import 'package:force_custom_protocol_pp/pingpong.dart';

ForceClient fc;
PlayPingPong playPingPong;

main() async {
  fc = new ForceClient();
  fc.connect();
  
  await fc.onConnected;
  
  playPingPong = new PlayPingPong(fc);
  fc.addProtocol(playPingPong.protocol());
  
  querySelector("#btn")
        ..text = "GO"
        ..onClick.listen(broadcast);
    
    fc.on("update", (fme, sender) {
      querySelector("#list").appendHtml("<div>${fme.json["todo"]}</div>");
    });
}

void  broadcast(MouseEvent event) {
  playPingPong.sendPing();
}
