 { config, pkgs, ... }:

 {
   services.taskserver = {
     enable = true;

     fqdn = "tasks.choreutes.de";

     listenHost = "tasks.choreutes.de";

     openFirewall = true;

     organisations = {
       "Privat" = {
         users = [
           "Linda Burhard"
           "Tobias Schmalz"
         ];
       };
     };
   };
 }
