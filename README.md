# Force custom protocol example

In this example we show you how to write a custom protocol within force.
When you want to extend or add another protocol you can do it like here.

We are going to create a ping pong protocol example, very basic, it sends out a ping and it gets a pong back.

## some explanation about the code

First of all you need to define a package class. It represents your data package that represents the protocol that is been send through the wire of the websocket.

```dart
class PingPongPackage extends Package {
      ...
}
```

Then we need to define the protocol that has a generic type of the package class.

```dart
class PingPongProtocol extends Protocol<PingPongPackage> {
  
  ProtocolDispatch<PingPongPackage> dispatcher;
  PingPongProtocol(this.dispatcher);
  
  bool shouldDispatch(data) {
      // Test what is typical for this protocol
      return data.contains("PING") || data.contains("PONG");
  }
  
  PingPongPackage onConvert(data, {wsId: "-"}) {
    return new PingPongPackage.fromJson(JSON.decode(data), wsId: wsId);
  }
 
}
```

In this class you have a method that looks at the data and returns a boolean when it is this protocol.
Then you need a onConvert method so we can convert the Package from JSON to the Package data.

And last but not least you need to define your dispatcher logic to anticipate when you get a certain package.

```dart
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
```

You need to override dispatch to handle the data package and anticipate on it. You have always access at the sendable object.

