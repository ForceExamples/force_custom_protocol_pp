part of pingpong;

class PingPongDispatcher extends ProtocolDispatch<PingPongPackage> {
  
  PingPongDispatcher();
  
  StreamController<String> _controller = new StreamController<String>();
  
  void dispatch(PingPongPackage ppp) {
    if (ppp.state == PingPongPackage.PING) {
      sendable.sendPackage(new PingPongPackage(PingPongPackage.PONG));
    }
    _controller.add(ppp.state);
  }
  
  Stream get state => _controller.stream;
 
}