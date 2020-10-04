// mas-mqtt-user

/* Initial goals */
!start.

/* Plans */
+!start <- .print("agent bot is running").

+!focus(Art,Ws)[source(node_red)]
   <- .print("Focusing on artifact ", Art, "...");
      joinWorkspace(Ws,WsId);
      lookupArtifact(Art,ArtId)[wid(WsId)];
      focus(ArtId)[wid(WsId)];
      .print("Ok");
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
