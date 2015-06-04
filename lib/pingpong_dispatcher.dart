part of pingpong;

class PingPongDispatcher extends ProtocolDispatch<PingPongPackage> {
  
  PingPongDispatcher();
  
  StreamController<String> _controller = new StreamController<String>();
  
  void dispatch(PingPongPackage ppp) {
    if (ppp.state == PingPongPackage.PING) {
      sendable.sendPackage(new PingPongPackage(PingPongPackage.PONG));
    }
    if (ppp.state != null) {
      _controller.add(ppp.state);
    } else {
      print ('ping pong stat is null');
    }
  }
  
  Stream get state => _controller.stream;
 
}