part of pingpong;

class PingPongDispatcher implements ProtocolDispatch<PingPongPackage> {
  
  SendablePackage sendablePackage;
  
  PingPongDispatcher(this.sendablePackage);
  
  StreamController<String> _controller = new StreamController<String>();
  
  void dispatch(PingPongPackage ppp) {
    if (ppp.state == PingPongPackage.PING) {
      sendablePackage.sendPackage(new PingPongPackage(PingPongPackage.PONG));
    }
    _controller.add(ppp.state);
  }
  
  Stream get state => _controller.stream;
 
}