// #include JH\_maptools; 
#include maps\mp\jm_memento\_cly_maptools;  // Non-JH only

main()
{
  // 1
  level.cly["player_mikro"] = "^6M^9ikro^5#";
  level.cly["player_suta"] = "SutaSanyi^1#";
  level.cly["player_dcoy"] = "^1dcoy^7.";

  
  level.cly["player_phylo"] = "^0Phylo";
  level.cly["player_victima"] = "^1*^7Victima";
  level.cly["player_bluzz"] = "bluzz";
  level.cly["player_maci"] = "nendecre^5w^7 maci^5.-";
  level.cly["player_freax"] = "freax.";

  // 2
  level.cly["player_titan"] = "^9Titan^5.!";
  level.cly["player_unknown"] = "Unknown";
  level.cly["player_aya"] = "aya";
  level.cly["player_dom1"] = "^7Dom^51^9natoRRR";
  level.cly["player_noise"] = "^0m4Ke s0Me nOoiSe";
  level.cly["player_piton"] = "^3-^0Bagolybaszok^3- ^5piton";
  level.cly["player_nightfury"] = "^9NightfurY";

  level.cly["player_davidson"] = "^0Da^3vi^0d^3$^0on";
  level.cly["player_limited"] = "^0Immortal^1Jumpers^7*.*^2lmtD";
  level.cly["player_danny"] = "^3Danny";
  level.cly["player_topinka"] = "nendecre^4w^7 TOPinka^4.-";
  level.cly["player_winz"] = "^5TOTO^6NESKOCIM^3:D^7winz";
  level.cly["player_rybax"] = "rybax";
  level.cly["player_padis"] = "^1Pa^7d^9is";
  level.cly["player_capik"] = "~CaPiK_#^6*";

  // 3
  level.cly["player_eni"] = "balancecrew^5.^7eni";
  level.cly["player_blade"] = "Blade";
  level.cly["player_spuri"] = "spurii";
  level.cly["player_pele"] = "Pele";
  level.cly["player_shawn"] = "Shawn";
  level.cly["player_deres"] = "^3Aranyparaszt^2|^4Deres";
  level.cly["player_davy"] = "raidz^5.^9davY";
  level.cly["player_sad"] = "^3T^7ouch p a d e r^3*^7SAD";
  level.cly["player_layla"] = "^9[^1OUT^9LAW^1]^9Lay^1la";
  level.cly["player_baket"] = "nendecre^3w ^7Baket^3.-";
  level.cly["player_gameboy"] = "^3[ ^2) ^3] ^9GAMEBOY^7?";
  
  level.cly["player_lazlo"] = "lazlo";
  level.cly["player_neverlucky"] = "neverlucky";
  level.cly["player_brian"] = "b^9rian^3.";
  level.cly["player_trela"] = "Trelacki^3#";
  level.cly["player_basem"] = "^9Jump^24^9Life^2|^9BaSeM";
  level.cly["player_voste"] = "voste";
  level.cly["player_wazzi"] = "^9Strafed^7Gaming ^4~ ^7Wazzi";
  level.cly["player_febo"] = "Febo";
  level.cly["player_kadel"] = "Kadel^6*";
  level.cly["player_virusko"] = "^5tu^6cn^3ak ^7virusk0";
  level.cly["player_pachee"] = "^6p^7ach^6ee";
  level.cly["player_luis"] = "luis^1.";
  level.cly["player_sfrzx"] = "COR^127 ^9steel^7series sfrzx";
  level.cly["player_g1ng3r"] = "g1ng3r";

  // 4
  level.cly["player_pauli"] = "Un^9Real^4.^9JumperZ^4/^7Pauli";
  level.cly["player_fmx"] = "Un^9Real^5.^9JumperZ^5/^7Fmx";
  level.cly["player_funki"] = "Un^9Real^2.^9JumperZ^2/^7funki";
  level.cly["player_grey"] = "Un^9Real^8.^9JumperZ^8/^7Gr3y!";
  level.cly["player_tomis"] = "Un^9Real^6.^9JumperZ^6/^7toMis";
  level.cly["player_tona"] = "Un^9Real^2.^9JumperZ^2/^7Tona";
  level.cly["player_cheri"] = "Un^9Real^1.^9JumperZ^1/^7Cheri";
  level.cly["player_claay"] = "Un^9Real^3.^9JumperZ^3/^7claay";

 
  initPlayerTrigs();
  thread initBodyFall();
  thread initGery();
  thread initTrela();
  thread initTomis();
  thread initPlayerStats();
  thread initUjStats();

}

initUjStats() {
  trig_name = "uj_stats";
  trig = getent(trig_name, "targetname");
  stats = "^340 ^7players from ^310 ^7nations";

  while(1) {
    trig waittill("trigger", player);
    if(!player maps\mp\jm_memento::hasTempTrigger(trig_name)) {
      player maps\mp\jm_memento::addTempTrigger(trig_name);
      player thread pPrintStats(trig_name, stats);
    }
    wait 0.1;
  }

}

initPlayerStats() {
  trig_name = "player_stats";
  trig = getent(trig_name, "targetname");
  stats = "^382 ^7players from ^324 ^7nations";
  while(1) {
    trig waittill("trigger", player);
    if(!player hasTrigger(trig_name)) {
      player addTrigger(trig_name);
      player thread pPrintStats(trig_name, stats);
    }
    wait 0.1;
  }
}

pPrintStats(trig_name, stats) {
  self endon("disconnect");
  self iprintln(stats);
  wait 5;
  self maps\mp\jm_memento::removeTempTrigger(trig_name);
}

initTrela() {
  trig = getent("trela", "targetname");
  orig = getent(trig.target, "targetname");
  while(1) {
    trig waittill("trigger", player);
    player playSoundAfter(trig, orig, "floytami", 32);
  }
}

initGery() {
  trig = getent("gery", "targetname");
  orig = getent(trig.target, "targetname");
  while(1) {
    trig waittill("trigger", player);
    player geryCountDown(trig, orig);
  }
}

geryCountDown(trig, orig) {
  self endon("disconnect");
  trigger_after = 5;  // Seconds
  if(!isdefined(level.cly["last_gery"]) || level.cly["last_gery"] == "gery_rdgrd") {
    to_play = "gery_dde_rde";
    to_print = &"MEM_GERY_DDE_RDE";
  }
  else {
    to_play = "gery_rdgrd";
    to_print = &"MEM_GERY_RDGRD";
  }

  while(trigger_after > 0 && self istouching(trig)) {
    wait 0.05;
    trigger_after -= 0.05;
  }

  if(self istouching(trig)) {
    orig playSound(to_play);
    self iprintln(to_print);
    level.cly["last_gery"] = to_play;
    wait 4;
  }
}

initTomis() {
  trig = getent("tomis", "targetname");
  orig = getent(trig.target, "targetname");
  while(1) {
    trig waittill("trigger", player);
    player playSoundAfter(trig, orig, "tomis", 29);
  }
}

playSoundAfter(trig, orig, sound, duration) {
  self endon("disconnect");
  trigger_after = 5;  // Seconds

  while(trigger_after > 0) {
    if(!self istouching(trig))
      return;
    
    wait 0.05;
    trigger_after -= 0.05;
  }
  orig playSound(sound);
  wait duration;
}

initBodyFall() {
  trig = getent("bodyfall", "targetname");
  orig = getent(trig.target, "targetname");

  while(1) {
    trig waittill("trigger", player);
    orig playSound("bodyfall_water");
    wait 5;
  }
}

initPlayerTrigs() {
  trigs = getentarray("gallery_player", "targetname");
  for(i=0; i < trigs.size; i++)
    trigs[i] thread trigDisplayPlayerName();

}

trigDisplayPlayerName() {
  player_name = level.cly["player_"+self.script_noteworthy];
  while(1) {
    self waittill("trigger", player);
    if(!player maps\mp\jm_memento::hasTempTrigger(player_name)) {
      player maps\mp\jm_memento::addTempTrigger(player_name);
      player thread pDisplayPlayerName(player_name);
    }
    wait 0.1;

  }
}

pDisplayPlayerName(player_name) {
  self endon("disconnect");
  self iprintlnbold(player_name);
  wait 7;
  self maps\mp\jm_memento::removeTempTrigger(player_name);
}
