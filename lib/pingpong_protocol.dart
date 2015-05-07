part of pingpong;

class PingPongProtocol extends Protocol<PingPongPackage> {
  
  StreamController<PingPongPackage> _controller;
  ProtocolDispatch<PingPongPackage> dispatcher;
  
  PingPongProtocol(this.dispatcher) {
    _controller = new StreamController<PingPongPackage>();
  }
  
  bool shouldDispatch(data) {
      // Test what is typical for this protocol
      return data.contains("PING") || data.contains("PONG");
  }
  
  PingPongPackage onConvert(data, {wsId: "-"}) {
    return new PingPongPackage.fromJson(JSON.decode(data), wsId: wsId);
  }
  
  void sendPing() {
    dispatcher.sendable.sendPackage(new PingPongPackage(PingPongPackage.PING));
  }
 
}