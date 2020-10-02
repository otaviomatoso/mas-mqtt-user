// mas-mqtt-user

/* Initial beliefs and rules */
url("http://localhost:1880/mqtt"). // (local) URL Dummy Art

/* Initial goals */
!start.

/* Plans */
+!start : url(U)
   <- register(U); // registers the URL for the Dummy Art
      .print("agent bot is running");
   .

+message(M)[source(percept)]
   <- .print("New signal from MQTT Artifact");
      .print("MESSAGE: ", M);
      .print("Sending this message to the User...");
      .send(user, tell, M);
   .

+message(M)[source(user)]
   <- .print("New message from User");
      .print("MESSAGE: ", M);
      Publish =.. [publish,[M],[]];
      .print("Publishing this message via mqtt artifact...");
      act(Publish, Res);
   .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
// { include("$jacamoJar/templates/org-obedient.asl") }
