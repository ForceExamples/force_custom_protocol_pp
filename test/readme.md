## Test your websocket protocol with Dartlang & Force

It is always good to write tests to test your websocket protocol!

First of all create a ForceServer instance and create a ForceClient with TestForceClient and make a connection with the server.

```dart
ForceServer fs = new ForceServer();
TestForce tf = new TestForce(fs);
TestForceClient fc = tf.forceClient;
fc.connect();
```

Then add your newly create protocol to the ForceServer instance.

```dart
      PlayPingPong playPingPong = new PlayPingPong();
      fs.addProtocol(playPingPong.protocol());
```

Then create an instance of the client protocol and add it to ForceClient.

```dart
      PlayPingPong playPingPongClient = new PlayPingPong();
      fc.addProtocol(playPingPongClient.protocol());
```

Then do and test protocol specific stuff.

```dart      
      playPingPongClient.sendPing();
     
      var server_state = await playPingPong.state_of_ping_pong.first;
           expect(server_state, 'PING');
```