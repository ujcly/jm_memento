// #include JH\_maptools; // JH only
// #include JH\_ambient;  // JH only
#include maps\mp\jm_memento\_cly_maptools;  // Non-JH only

main(){
  maps\mp\jm_memento\precaches::precache();
  if(!isDefined(level.cly))
    level.cly = [];
  if(!isDefined(level._effect))
    level._effect = [];

  game["allies"] = "russian";
  game["axis"] = "german";
  game["attackers"] = "allies";
  game["defenders"] = "axis";
  game["american_soldiertype"] = "normandy";
  game["german_soldiertype"] = "normandy";

  // Text shown upon entry of a map part
  level.entertexts = [];  // 1st line
  level.entertexts2 = []; // 2nd line
  level.entertexts[0] = &"MEM_PART_1_A";
  level.entertexts2[0] = &"MEM_PART_1_B";
  level.entertexts[1] = &"MEM_PART_2_A";
  level.entertexts2[1] = &"MEM_PART_2_B";
  level.entertexts[2] = &"MEM_PART_3_A";
  level.entertexts2[2] = &"MEM_PART_3_B";
  level.entertexts[3] = &"MEM_PART_4_A";
  level.entertexts2[3] = &"MEM_PART_4_B";

  maps\mp\_load::main();
  maps\mp\jm_memento\jm_memento_fx::main();
  maps\mp\jm_memento\p4_maps::main();
  maps\mp\jm_memento\gallery::main();
  maps\mp\jm_memento\finish_party::main();

  initTeleports();
  initFadeTeleports();

  thread enterP1();
  thread enterP2();
  thread enterP3();
  thread enterP4A();
  thread enterP4B();
  thread enterP4BTele();
  
  initSecretTeleports();
  initBoothTeleports();

  // Spawn & renai
  initSnowStorm();

  // Gaps
  initTrigNice();
  
  // P1
  thread initShowEnterP1Text();
  thread initPotatoStart();
  thread initCod1();
  
  // P2
  thread initToiletDoor();
  thread p2StopAmbient();
  thread initJesse();
  thread initLeap();
  
  // P3
  initBouncePads();

  // P4
  initTunnel();
  initMapInfo();
  initHideQuote();
  thread initBullseye();
  thread enterFinish();
  thread initMoveKappa();
  thread initKanyeTeleport();
  thread initDescendOld();
  thread initCruiseTop();

  // Finish
  initMapPartTeleports();
  thread initEnterGallery();
  thread initPotatoEnd();

  level.historyLoadFunc = ::onHistoryLoad;
  level.reset_player = ::onPlayerReset;
}

onHistoryLoad() {
  // Called when player loads a run from history (JH only). Triggers are loaded from the previous run, we need to pick the latest.
  if(self hasTrigger("enter_p4_b"))
    self pEnsurePart("p4_b");
  else if(self hasTrigger("enter_p4_a"))
    self pEnsurePart("p4_a");
  else if(self hasTrigger("enter_p3"))
    self pEnsurePart("p3");
  else if(self hasTrigger("enter_p2"))
    self pEnsurePart("p2");
  else if(self hasTrigger("enter_p1"))
    self pEnsurePart("p1");
}

onPlayerReset() {
  // Called when player resets (JH only)
  self notify("player_reset");
  self setAmbient(); // Stop ambient music
  self maps\mp\jm_memento\finish_party::cleanUpMenu();
  self.cly = [];
}

addTempTrigger(trig) {
  if(!isdefined(self.cly["trigs"]))
    self.cly["trigs"] = [];
  self.cly["trigs"][trig] = true;
}

hasTempTrigger(trig) {
  if(!isdefined(self.cly["trigs"]))
    return false;
  if(!isdefined(self.cly["trigs"][trig]))
    return false;
  return true;
}

removeTempTrigger(trig) {
  self.cly["trigs"][trig] = undefined;
}

initCruiseTop() {
  trig = getent("cruise_top", "targetname");
  while(1) {
    trig waittill("trigger", player);
    if(!player hasTempTrigger("cruise_top")) {
      player addTempTrigger("cruise_top");
      player thread pCruiseTop();
    }
    wait 0.1;
  }
}

pCruiseTop() {
  self endon("disconnect");
  self iprintlnbold("Why?");
  wait 20;
  self removeTempTrigger("cruise_top");
}

initDescendOld() {
  trig = getent("descend_old", "targetname");
  while(1) {
    trig waittill("trigger", player);
    if(!player hasTempTrigger("descend_old")) {
      player addTempTrigger("descend_old");
      player thread pDescendOld();
    }
    wait 0.1;
  }
}

pDescendOld() {
  self endon("disconnect");

  wait 0.8;
  self iprintln("^3H^7m it's gone");
  wait 2;
  self iprintln("^3T^7ime to go...");
  wait 30;
  self removeTempTrigger("descend_old");
}

initKanyeTeleport() {
  trig = getent("teleport_kanye", "targetname");
  target = getent(trig.target, "targetname");
  while(1) {
    trig waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player addTrigger("tp_kanye");
      player thread pKanyeTeleport(target);
    }
    wait 0.1;
  }
}

pKanyeTeleport(target) {
  self endon("disconnect");

  self thread hudFadeWhite(0.1, true, 0.7);
  self setorigin(target.origin);
  self thread hudFadeWhite(0.2, true, 0);
  self setBusy(false);
}

initTrigNice() {
  trigs = getentarray("trig_nice", "targetname");

  for(i=0; i<trigs.size; i++) {
    trigs[i] thread trigNice("trig_nice_"+i);
  }

}

trigNice(trig_name) {
  while(1) {
    self waittill("trigger", player);
    if(!player hasTempTrigger(trig_name)) {
      player addTempTrigger(trig_name);
      player thread pTrigNice(trig_name);
    }
    wait 0.1;
  }
}

pTrigNice(trig_name) {
  self endon("disconnect");
  self playSound("nice");
  wait 15;
  self removeTempTrigger(trig_name);
}


initBullseye() {
  trig = getent("bullseye", "targetname");
  while(1) {
    trig waittill("trigger", player);
    player iPrintLnBold("^1We don't do that here...");
    wait 0.1;
  }
}

initJesse() {
  trig = getent("jesse", "targetname");
  orig = getent(trig.target, "targetname");

  while(1) {
    trig waittill("trigger");
    orig playSound("jesse");
    wait 15;
  }
}

initPotatoEnd() {
  trig = getent("potato_end", "targetname");
  potato = getent(trig.target, "targetname");
  fx_orig = getent("fx_potato", "targetname");
  secret_name = "potato";

  potato hide();
  potato notsolid();
  
  trig setHintString("Did you find it?");
  reset = false;
  while(1) {
    trig waittill("trigger", player);
    if(!player hasSecret(secret_name)) {
      player iprintlnbold("Nope");
      continue;
    }
    if(reset) {
      potato hide();
      potato moveZ(56, 0.1);
      wait 0.1;
    }
    trig setCursorHint("HINT_NONE");

    player_name = player.name;
    player playPotatoSequence(player_name, potato, fx_orig);
    wait 5;
    trig setHintString(player_name+"^7 was the last one to bring me here");
    trig setCursorHint("HINT_ACTIVATE");
    reset = true;
  }
}

playPotatoSequence(player_name, potato, fx_orig) {
  self endon("disconnect");
  self iprintln("gg "+player_name);
  wait 1;
  self iprintln("now look up");
  wait 1;
  potato show();
  potato playSound("uefa");
  potato moveZ(-56, 19, 0, 8);
  potato rotateRoll(360, 19, 0, 3);
  playFX(level._effect["potato"], fx_orig.origin);
  wait 23;
}

initPotatoStart() {
  trig = getent("potato_start", "targetname");
  potato = getent(trig.target, "targetname");
  secret_name = "potato";
  potato notSecretOnly(secret_name);

  trig setHintString("Potato ");

  while(1) {
    trig waittill("trigger", player);
    if(!player hasSecret(secret_name)) {
      player addSecret(secret_name);
      player iPrintLn("^3N^7ow you are fluent in Danish");
    }
    wait 0.1;
  }
}

initCod1() {
  trig = getent("cod1", "targetname");
  orig = getent(trig.target, "targetname");

  while(1) {
    trig waittill("trigger");
    orig playSound("cod1");
    trig setCursorHint("HINT_NONE");
    wait 61;
    trig setCursorHint("HINT_ACTIVATE");
  }
}


initMapInfo() {
  trigs = getentarray("trig_map_info", "targetname");
  for(i=0; i<trigs.size; i++) {
    trigs[i] thread doMapInfo(i);
  }
}

doMapInfo(index) {
  trig_name = "show_map_info_"+index;

  map_info = level.cly["maps"][self.script_noteworthy];
  y_offset = self.script_noteworthy2;
  while(1) {
    self waittill("trigger", player);
    if(!player hasTempTrigger(trig_name)) {
      player addTempTrigger(trig_name);
      player thread pShowMapInfo(trig_name, map_info, y_offset);
    }
    wait 0.1;
  }
}

pShowMapInfo(trig_name, map_info, y_offset) {
  self endon("disconnect");
  self pShowMapInfoText(map_info, y_offset);
  wait 2;
  self removeTempTrigger(trig_name);
}

pShowMapInfoText(map_info, y_offset) {
  // Displays the map name and author when entering a specific map part in part 4
  self endon("disconnect");

  x1 = 580;
  y1 = 360;

  // To avoid overlapping
  if(isDefined(y_offset))
    y1 += int(y_offset);
  
  text_color = (1, 0.69, 0);
  info_text = newClientHudElem(self);
  info_text.color = text_color;
  info_text.x = x1;
  info_text.y = y1;
  info_text.fontscale = 0.85;

  info_text.alignX = "left";
  info_text.alignY = "bottom";

  info_text settext(map_info);
  info_text.alpha = 0;
  info_text fadeovertime(1);
  info_text.alpha = 1;
  info_text.sort = 1000;
  info_text.foreground = 1;

  wait 3;
  info_text fadeovertime(1);
  info_text.alpha = 0;
  wait 1;

  info_text destroy();
}

initBoothTeleports() {
  trigs = getentarray("teleport_booth", "targetname");
  for(i=0; i<trigs.size; i++) {
    trigs[i] thread boothTeleport();
  }
}

boothTeleport() {
  // Teleports player from the finish to area with a secret
  target = getent(self.target, "targetname");
  self setHintString("Search for track #"+self.script_noteworthy);

  while(1) {
    self waittill("trigger", player);
    player setorigin(target.origin);
    player setPlayerAngles(target.angles);
    wait 0.5;
    player iPrintLn("^3Take a look around (crouch is your friend)");
  }
}

initSecretTeleports() {
  trigs = getentarray("teleport_secret", "targetname");
  for(i=0; i<trigs.size; i++) {
    trigs[i] thread secretTeleport();
  }
}

secretTeleport() {
  // Teleports player from the a secret to the finish
  target = getent(self.target, "targetname");
  self setHintString("Take me to the finish");

  while(1) {
    self waittill("trigger", player);
    if(!player hasTrigger("enter_gallery_tp")) {
      player iPrintLnBold("^1Naah, bruh, it's only for those who have finished the map already");
      continue;
    }
    player setorigin(target.origin);
    player setPlayerAngles(target.angles);
    wait 0.1;
  }
}

initMoveKappa() {
  trig = getent("move_kappa", "targetname");
  target = getent(trig.target, "targetname");
  target hide();
  
  while(1) {
    trig waittill("trigger");
    target show();
    target moveX(-250, 7);
    target waittill("movedone");
    target hide();
    wait 3;  // Cooldown
    trig waittill("trigger");
    target show();
    target moveX(250, 7);
    target waittill("movedone");
    target hide();
    wait 3;  // Cooldown
  }
}

initHideQuote() {
  trigs = getentarray("hide_quote_cover", "targetname");

  for(i=0; i<trigs.size; i++) {
    trigs[i] thread hideQuote();
  }
}

hideQuote() {
  cover = getent(self.target, "targetname");
  quote = getent(cover.target, "targetname");
  fx_orig = cover.origin;
  quote hide();

  self waittill("trigger");
  cover hide();
  PlayFX(level._effect["quote_poof"], cover.origin);
  cover playSound("poof");
  wait 0.1;
  quote show();
  cover delete();
  self delete();
}

initMapPartTeleports() {
  trigs = getentarray("finish_map_part_teleport", "targetname");
  for(i = 0; i < trigs.size; i++) {
    trigs[i] thread trigMapPartTeleport();
  }
}

trigMapPartTeleport() {
  target = getent(self.target, "targetname");
  while(1) {
    self waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player pTeleportToMapPart(self.script_noteworthy, target);
    }
    wait 0.1;
  }
}

pTeleportToMapPart(part_name, target) {
  switch(part_name) {
    case "p1":
      self thread pEnterP1(target);
      break;
    case "p2":
      self thread pEnterP2(target);
      break;
    case "p3":
      self thread pEnterP3(target);
      break;
    case "p4":
      self thread pEnterP4FromFinish(target);
      break;
    case "end":
      self thread pEnterGallery(target);
      break;
  }
}

pEnterP4FromFinish(target) {
  self endon("disconnect");

  self hudFadeBlack(0.1, false, 1);
  self setorigin(target.origin);
  self setplayerangles(target.angles);
  self freezecontrols(true);
  wait 1;
  self pEnsurePart("p4_a");

  self pShowEnterText(4);

  wait 2.4;
  self freezecontrols(false);
  self hudFadeBlack(4, true, 0);

  self setBusy(false);
}

p2StopAmbient() {
  trig = getent("p2_stop_ambient", "targetname");
  trig_name = "p2_stop_ambient";
  while(1)
  {
    trig waittill("trigger", player);
    if(!player hasTrigger(trig_name)) {
      player setAmbient();
      player addTrigger(trig_name);
    }
    wait 0.1;
  }
}

initSnowStorm() {
  speakers = getentarray("snow_storm", "targetname");
  for(i = 0; i < speakers.size; i++) {
    speakers[i] playloopsound("snow_storm");
  }

  speakers = getentarray("snow_storm_renai", "targetname");
  for(i = 0; i < speakers.size; i++) {
    speakers[i] playloopsound("snow_storm_renai");
  }
}

initTeleports() {
  teleports = getentarray("teleport_classic","targetname");
  for(i = 0; i < teleports.size; i++)
    teleports[i] thread classicTeleport(i);
}

classicTeleport(i) {
  entTarget = getent(self.target, "targetname");
  trig_name = "classic_tp_" + i;
  should_set_angles = self.script_noteworthy;
  while(true)
  {
    self waittill("trigger", player);
    if(!player isBusy())
    {
      player setBusy(true);
      player addTrigger(trig_name);
      player setorigin(entTarget.origin);
      if(isdefined(should_set_angles))
        player setPlayerAngles(entTarget.angles);
      player setBusy(false);
    }
    wait 0.1;
  }
}

initFadeTeleports() {
  teleporters = getentarray("teleport_fade", "targetname");
  for(i = 0; i < teleporters.size; i++)
  {
    teleporters[i] thread fadeTeleport(i);
  }
}

fadeTeleport(i) {
  target = getent(self.target, "targetname");
  trig_name = "fade_tp_" + i;
  while(true) {
    self waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player addTrigger(trig_name);
      player thread pFadeTeleport(target, i);
    }
  }
}

pFadeTeleport(target, i) {
  self endon("disconnect");
  self freezecontrols(true);	
  self hudFadeBlack(0.5, false, 1);
  wait 0.5;
  self setorigin(target.origin);
  self freezecontrols(false);
  wait 0.1;
  self hudFadeBlack(0.5, true, 0);
  self setBusy(false);
}

initToiletDoor() {
  door = getent ("toilet_door","targetname");
  trig = getent ("toilet_doortrig","targetname");
  door_sound = getent ("door_sound","targetname");
  while (1) {
    trig waittill ("trigger");
    door rotateto ((0, 90,0), 1);
    door_sound playsound("castle_dooropen");
    door waittill("rotatedone");
    wait 4;
    door notsolid();
    door rotateto ((0, 0,0), 1.7);
    door_sound playsound("castle_slamdoor");
    door waittill("rotatedone");
    door solid();
  }
}

enterP1() {
  trig = getent("enter_p1", "targetname");
  target = getent(trig.target, "targetname");

  while(true) {
    trig waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player addTrigger("enter_p1");
      player thread pEnterP1(target);
    }
    
    wait 0.1;
  }
}

pEnterP1(target) {
    self endon("disconnect");

    self pEnsurePart("p1");
    self freezecontrols(true);
    self hudFadeBlack(0.1, false, 1);
    wait 0.5;
    self setorigin(target.origin);
    self setplayerangles(target.angles);
    wait 2.5;
    self freezecontrols(false);
    self hudFadeBlack(4.5, true, 0);
    self setBusy(false);
}

initShowEnterP1Text() {
  trig = getent("show_enter_text", "targetname");
  trig_name = "show_enter_text";
  while(true) {
    trig waittill("trigger", player);
    if(!player hasTrigger(trig_name)) {
      player addTrigger(trig_name);
      player thread pShowEnterText(1);
    }
  }
}

pShowEnterText(part_index, x1, y1, x2, y2) {
  // Displays text when entering a new part. Default placement is in the center of the screen.
  self endon("disconnect");

  if(!isdefined(x1))
    x1 = 323;
  else
    x1 = int(x1);
  if(!isdefined(x2))
    x2 = x1;
  else
    x2 = int(x2);
  if(!isdefined(y1))
    y1 = 230;
  else
    y1 = int(y1);
  if(!isdefined(y2))
    y2 = y1 + 30;
  else
    y2 = int(y2);
  
  part_index = int(part_index);
  text_color = (0.9, 0.6, 0);
  partentertext = newClientHudElem(self);
  partentertext.color = text_color;
  partentertext.x = x1;
  partentertext.y = y1;
  partentertext.fontscale = 2;

  partentertext.alignX = "center";
  partentertext.alignY = "bottom";
  partentertext settext(level.entertexts[part_index - 1]);
  partentertext.alpha = 0;
  partentertext fadeovertime(1);
  partentertext.alpha = 1;
  partentertext.sort = 1000;
  partentertext.foreground = 1;

  wait 2;

  partentertext2 = newClientHudElem(self);
  partentertext2.color = text_color;
  partentertext2.x = x2;
  partentertext2.y = y2;
  partentertext2.font = "bigfixed";
  partentertext2.fontscale = 1.15;
  partentertext2.alignX = "center";
  partentertext2.alignY = "bottom";
  partentertext2 settext(level.entertexts2[part_index - 1]);
  partentertext2.alpha = 0;
  partentertext2 fadeovertime(1.5);
  partentertext2.alpha = 1;
  partentertext2.sort = 999;
  partentertext2.foreground = 1;

  wait 4;
  partentertext fadeovertime(1);
  partentertext.alpha = 0;
  partentertext2 fadeovertime(1);
  partentertext2.alpha = 0;
  wait 1;
  partentertext destroy();
  partentertext2 destroy();
}

enterP2() {
  trig = getent("enter_p2", "targetname");
  target = getent(trig.target, "targetname");
  while(1)
  {
    trig waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player addTrigger("enter_p2");
      player thread pEnterP2(target);
    }

    wait 0.1;
  }
}

pEnterP2(target) {
  self endon("disconnect");

  self pEnsurePart("p2");
  self freezecontrols(true);
  self hudFadeBlack(0.2, false, 1);
  wait 4;
  self thread pShowEnterText(2, undefined, undefined, 319);
  wait 7;

  self setorigin(target.origin);
  self setplayerangles(target.angles);

  self freezecontrols(false);
  self hudFadeBlack(4, true, 0);

  self setBusy(false);
}

initLeap() {
  trig = getent("leap", "targetname");
  while(1)
  {
    trig waittill("trigger", player);
    if(!player hasTempTrigger("leap")) {
      player addTempTrigger("leap");
      player thread pLeap();
    }
    wait 0.1;
  }
}

pLeap() {
  self endon("disconnect");
  self playLocalSound("leap");
  wait 5;
  self removeTempTrigger("leap");
}

enterP3() {
  trig = getent("enter_p3", "targetname");
  target = getent(trig.target, "targetname");

  while(1)
  {
    trig waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player addTrigger("enter_p3");
      player thread pEnterP3(target);
    }
    wait 0.1;
  }
}

pEnterP3(target) {
  self endon("disconnect");

  self freezecontrols(true);
  self hudFadeBlack(1, false, 1);
  wait 1;
  self pEnsurePart("p3");
  self thread pShowEnterText(3);
  wait 5.1;

  self setorigin(target.origin);
  self setplayerangles(target.angles);

  wait 2;
  self freezecontrols(false);
  self hudFadeBlack(4, true, 0);
  
  self setBusy(false);
}

enterP4A() {
  trig = getent("enter_p4_a", "targetname");
  target = getent(trig.target, "targetname");
  while(1)
  {
    trig waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player addTrigger("enter_p4_a");
      player thread pEnterP4A(target);
    }
    
    wait 0.1;
  }
}

pEnterP4A(target) {
    self endon("disconnect");

    model = spawn("script_origin",(0,0,0));
    model.origin = self.origin;
    self linkto(model);
    model moveZ(1440, 9, 0.5);
    wait 4;

    self hudFadeRed(1.5, false, 1);
    wait 1;
    self hudFadeBlack(0.1, false, 1);
    self freezecontrols(true);
    self unlink();
    model delete();
    self setorigin(target.origin);
    self setplayerangles(target.angles);

    self hudFadeRed(1.5, false, 0);
    wait 1;
    self pEnsurePart("p4_a");

    self pShowEnterText(4);
  
    wait 2.4;
    self freezecontrols(false);
    self hudFadeBlack(4, true, 0);

    self setBusy(false);
}

enterP4B() {
  trig = getent("enter_p4_b", "targetname");
  while(1) {
    trig waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player addTrigger("enter_p4_b");
      player thread pEnterP4B();
    }
    
    wait 0.1;
  }
}

pEnterP4B() {
  self endon("disconnect");
  
  self pEnsurePart("p4_b");
  model = spawn("script_origin", (0,0,0));
  model.origin = self.origin;
  self linkto(model);
  model moveZ(-1711, 7.9, 0, 2.5);
  wait 7.8;

  self unlink();
  model delete();
  
  self setBusy(false);
}

enterP4BTele() {
  trig = getent("enter_p4_b_tele", "targetname");
  target = getent(trig.target, "targetname");
  while(1)
  {
    trig waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player thread pEnterP4BTele(target);
    }
    wait 0.1;
  }
}

pEnterP4BTele(target) {
  self endon("disconnect");
  self thread fadeFromWhite(4, 1, 0);

  player_angles = self getPlayerAngles();
  self setorigin(target.origin);

  // Keep only player's up/down angles
  self setplayerangles((player_angles[0], target.angles[1], player_angles[2]));
  
  self setBusy(false);
}


hudFadeRed_black() {
  self endon("disconnect");

  self hudFadeRed(1.5, false, 1);
  wait 0.2;
  self hudFadeBlack(0.5, false, 1);
  self hudFadeRed(0.5, false, 0);
  wait 1.5;
  
  self hudFadeBlack(4, true, 0);
}

pDoMusic(part_name) {
  self endon("disconnect");
  self endon("player_reset");

  self notify("domusic");
  self endon("domusic");

  self setAmbient(); // Stop the old ambient music
  switch(part_name) {
    case "p1":
      // Only the second track from p1 should repeat
      sundown_seconds = 334;
      self setAmbient("ambient_p1_sundown", sundown_seconds, false);
      wait sundown_seconds;
      self setAmbient("ambient_p1_dreams", 308);
      break;
    case "p2":
      self playlocalsound("boom");
      wait 3;
      self setAmbient("ambient_p2", 1047);
      break;
    case "p3":
      self setAmbient("ambient_p3", 271);
      break;
    case "p4_a":
      self setAmbient("ambient_p4_a", 73);
      break;
    case "p4_b":
      self setAmbient("ambient_p4_b", 1080);
      break;
    case "gallery":
      self setAmbient("ambient_gallery", 193, false);
      break;
  }
}

pEnsurePart(name) {
  if(!isdefined(self.cly))
    self.cly = [];

  if(!isDefined(self.cly["part"]) || self.cly["part"] != name) {
    self.cly["part"] = name;
    self thread pDoMusic(name);
  }
}

initBouncePads() {
  pads = getentarray("bounce_pad","targetname");
  for(i=0; i<pads.size; i++)
  {
    pads[i] thread doBouncePad();
  }
}

doBouncePad() {
  target = getent(self.target, "targetname");
  while (1)
  {
    self waittill ("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player thread jump(target.origin, int(self.script_noteworthy));
    }
    wait 0.5;
  }
}

jump(end, v0) {
  // Original by IzNoGoD
  self endon("disconnect");

  model = spawn("script_origin",(0,0,0));
  model.origin = self.origin;
  model.angles = self.angles;;
  self linkto (model);

  if(!isdefined(v0)) {
    v0 = 1575;
  }
  start = self.origin;
  height = end[2] - start[2];

  if(height > 0) {
    v0_min_squared = height * getcvarint("g_gravity") / 0.5;
  }		
  t0 = v0 / getcvarint("g_gravity");
  s0 = 0.5 * getcvarint("g_gravity") * t0 * t0;
  height -= s0;
  
  if(height > 0)
    return false;

  t1sq = -2 * height / getcvarint("g_gravity");
  time = int((sqrt(t1sq) + t0) * 20) / 20;
  xdist = end[0] - start[0];
  ydist = end[1] - start[1];
  xspeed = xdist / time;
  yspeed = ydist / time;
  model movegravity((xspeed, yspeed, v0), time);
  wait time;
  self unlink();

  self setBusy(false);
  model delete();
} 

sqrt(x) {
    y = x;
    for(z = x * 0.25; abs(z - y) >= 0.001; y = (z + (x / z) ) * 0.5) {
      z = y;
    }
    return y;
} 

abs(num) {
  if (num < 0)
    num*= -1;
  return num;
}
hudFadeRed(time, hud, a) {
  self endon("disconnect");

  if(!isdefined(self.hudfadered)) {
    self.hudfadered = newclienthudelem(self);
    self.hudfadered.x = 0;
    self.hudfadered.y = 0;
    self.hudfadered.alignX = "left";
    self.hudfadered.alignY = "top";
    self.hudfadered.horzAlign = "fullscreen";
    self.hudfadered.vertAlign = "fullscreen";
    self.hudfadered.alpha = 0;
    self.hudfadered.sort = 8000;
    self.hudfadered.foreground = 1;
    self.hudfadered.color = (1, 0.2, 0.2);
    self.hudfadered setshader("white", 650, 480);
  }
  if(time>0)
    self.hudfadered fadeovertime(time);
  self.hudfadered.alpha = a;
  wait time;
  if(hud)	{
    self setclientcvar("hud_enable","1");
    self setclientcvar("cg_cursorhints","4");
  }
  else {
    self setclientcvar("hud_enable","0");
    self setclientcvar("cg_cursorhints","0");
  }
}

hudFadeBlack(time, hud, a) {
  self endon("disconnect");
  
  if(!isdefined(self.fadetoblack))
  {
    self.fadetoblack = newclienthudelem(self);
    self.fadetoblack.x = 0;
    self.fadetoblack.y = 0;
    self.fadetoblack.alignX = "left";
    self.fadetoblack.alignY = "top";
    self.fadetoblack.horzAlign = "fullscreen";
    self.fadetoblack.vertAlign = "fullscreen";
    self.fadetoblack.alpha = 0;
    self.fadetoblack.sort = 8000;
    self.fadetoblack setshader("black", 650, 480);
  }
  if(time>0)
    self.fadetoblack fadeovertime(time);
  self.fadetoblack.alpha = a;
  wait time;
  if(hud)	{
    self setclientcvar("hud_enable","1");
    self setclientcvar("cg_cursorhints","4");
  }
  else {
    self setclientcvar("hud_enable","0");
    self setclientcvar("cg_cursorhints","0");
  } 
}

hudFadeWhiteBlack() {
  self endon("disconnect");
  
  self hudFadeWhite(2, false, 1);
  wait 0.2;
  self hudFadeBlack(1.5, false, 1);
  self hudFadeWhite(1.5, true, 0);
  wait 2;
  self hudFadeBlack(4, true, 0);
}

hudFadeWhite(time, hud, a) {
  self endon("disconnect");
  
  if(!isdefined(self.hudfadewhite))
  {
    self.hudfadewhite = newclienthudelem(self);
    self.hudfadewhite.x = 0;
    self.hudfadewhite.y = 0;
    self.hudfadewhite.alignX = "left";
    self.hudfadewhite.alignY = "top";
    self.hudfadewhite.horzAlign = "fullscreen";
    self.hudfadewhite.vertAlign = "fullscreen";
    self.hudfadewhite.alpha = 0;
    self.hudfadewhite.sort = 8000;
    self.hudfadewhite.foreground = 1;
    self.hudfadewhite setshader("white", 650, 480);
  }
  if(time>0)
    self.hudfadewhite fadeovertime(time);
  self.hudfadewhite.alpha = a;
  wait time;
  if(hud)	{
    self setclientcvar("hud_enable","1");
    self setclientcvar("cg_cursorhints","4");
  }
  else {
    self setclientcvar("hud_enable","0");
    self setclientcvar("cg_cursorhints","0");
  } 
}

fadeFromWhite(time, fadeFromAlpha, fadeToAlpha) {
  self endon("disconnect");
  
  if(!isdefined(self.fader)) {
    self.fader = newclienthudelem(self);
    self.fader.x = 0;
    self.fader.y = 0;
    self.fader.alignX = "left";
    self.fader.alignY = "top";
    self.fader.horzAlign = "fullscreen";
    self.fader.vertAlign = "fullscreen";
    self.fader.foreground = 1;
    self.fader.sort = 8000;
    self.fader setshader("white", 650, 480);
  }
  self.fader.alpha = fadeFromAlpha;
  self.fader fadeovertime(time);
  self.fader.alpha = fadeToAlpha;
  wait time;
  self.fader destroy();
  self.fader = undefined;
}

//P4

initTunnel(){
  // Starts the moving walls in the first section of P4
  tunnell_floor_count = 5;
  tunnel_moving_time = 23;  // How long it takes from top to bottom - more time => slower

  for(i = 1; i <= tunnell_floor_count; i++) {
    floor = getentarray("tunnel_floor_" + i, "targetname");
    for(j = 0; j < floor.size; j++) {
      floor[j] thread tunnelMoveDown(i, tunnell_floor_count, tunnel_moving_time);
    }
  }
}

enterFinish() {
  // The garden
  trig = getent("enter_finish", "targetname");
  target = getent(trig.target, "targetname");
  while(1) {
    trig waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player addTrigger("enter_finish");
      player thread pEnterFinish(target);
    }
    wait 0.1;
  }
}

pEnterFinish(target) {
  self endon("disconnect");

  orig = spawn ("script_origin",(0,0,0));
  orig.origin = self.origin;
  self linkto(orig);
  orig moveZ(2880, 18, 2);
  wait 15;
  self thread hudFadeWhiteBlack();
  wait 4;
  self setAmbient();
  wait 0.1;
  self unlink();
  self setorigin(target.origin);
  self setplayerangles(target.angles);
  orig delete();
  wait 3;

  self setBusy(false);
}

tunnelMoveDown(num, floor_count, moving_time) {
  // Moves walls in p4 down and back infinitely making an elevator effect
  moving_distance = -6017;
  while(true) {
    for(i = 1; i < num; i++) {
      self moveZ(moving_distance, moving_time);
      wait moving_time;
    }	
    self hide();
    self notsolid();
    self moveZ(-1 * moving_distance * (floor_count - 1), 0.1);
    wait moving_time;
    self show();
    for(; i < floor_count; i++) {
      self moveZ(moving_distance, moving_time);
      wait moving_time;
    }
  }
}

initEnterGallery() {
  trig = getent("enter_gallery", "targetname");
  target = getent(trig.target, "targetname");
  while(1)
  {
    trig waittill("trigger", player);
    if(!player isBusy()) {
      player setBusy(true);
      player addTrigger("enter_gallery_tp");
      player thread pEnterGallery(target);
    }
    wait 0.1;
  }
}

pEnterGallery(target) {
  self endon("disconnect");
  self thread pDoMusic("gallery");
  self hudFadeBlack(0.5, false, 1);

  wait 5.5;
    
  player_angles = self getPlayerAngles();
  self setorigin(target.origin);

  // Keep only player's up/down angles
  self setplayerangles((player_angles[0], target.angles[1], player_angles[2]));

  self hudFadeBlack(4, true, 0);
  self setBusy(false);
}
