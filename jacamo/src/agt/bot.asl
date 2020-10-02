// mas-mqtt-user

/* Initial beliefs and rules */


/* Initial goals */
!start.

/* Plans */
+!start
   <- .print("agent bot is running");
   .

+message(M)[source(percept)]
   <- .print("Signal received from MQTT Artifact");
      .print("MESSAGE: ", M);
   .


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
// { include("$jacamoJar/templates/org-obedient.asl") }
