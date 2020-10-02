// mas-mqtt-user

/* Initial beliefs and rules */


/* Initial goals */
!start.

/* Plans */
+!start
   <- .print("agent bot is running");
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
   .

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
// { include("$jacamoJar/templates/org-obedient.asl") }
