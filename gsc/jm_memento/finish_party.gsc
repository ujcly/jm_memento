// #include JH\_maptools; // JH only
// #include JH\_ambient;  // JH only
#include maps\mp\jm_memento\_cly_maptools;  // Non-JH only

main()
{  
  // How many times in a row can player change a track without getting cooldown
  level.cly["MAX_MENU_ABUSE_COUNT"] = 5;
 
  // How long needs the player wait to play another track if he was the last DJ (to let others have their chance to select a track too)
  level.cly["PLAYER_COOLDOWN"] = 10;

  // How long the DJ menu stays open (seconds)
  level.cly["MENU_TIME_LIMIT"] = 10;
  // ---------------------

  initMusicPlayer();
  initFloor();
  hideTracks();
  initTrackPickupTrig();
  thread initBeams();
  thread prepareWoofers();
  thread prepareFloors();
  // wait 0.1;
  thread initMenu();
}

playSabaton() {
  duration = level.cly["music_player"]["track_durations"]["sabaton"];
  setTimeLeft(duration);

  startMusic("sabaton");
  thread doSabatonFx();
}

doSabatonStage() {
  T = 11.07;
  thread switchOnWoofer("red", 0, T);
  T += 1.7;
  thread switchOnWoofer("red", 1, T);
  T += 1.5;
  thread switchOnWoofer("red", 2, T);
  T += 1.6;
  thread switchOnWoofer("red", 3, T);
  T += 1.55;
  thread switchOnWoofer("red", 4, T);
  T += 1.58;
  thread switchOnWoofer("red", 5, T);
  T += 1.53;
  thread switchOnWoofer("red", 6, T);
  T += 1.6;
  thread switchOnWoofer("red", 7, T);

  T = 22.13;
  thread switchOnFloor("red", 22.13);
  
  duration = level.cly["music_player"]["track_durations"]["sabaton"];

  wait duration + 1;
  T = 0;
  for(i=7; i>=0; i--) {
    thread switchOnWoofer("black", i, T);
    T += 0.1;
  }
  thread switchOnFloor("blue", T+0.15);
}

doSabatonFx() {
  thread doSabatonStage();

  center_orig_top = strTok("fx_center", "|");
  thread playEffect("party_sabaton_smoke", center_orig_top, 1, 3.5, 0.7); 
  
  T = 24.40;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);
  T += 1.57;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);

  T += 1.57;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);

  T += 1.57;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);
  T += 1.57;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);
  T += 1.57;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);
  T += 1.57;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);
  T += 1.57;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);

  T += 0.42;
  thread doSabatonLine("x", 1, T, 0);
  thread doSabatonLine("x", 4, T, 0);

  T += 0.27;
  thread doSabatonLine("x", 2, T, 0);
  thread doSabatonLine("x", 3, T, 0);

  T += 0.5;
  thread doSabatonLine("x", 1, T, 0);
  thread doSabatonLine("x", 4, T, 0);

  T += 0.47;
  thread doSabatonChorusSection(T);

  T = 49.54;
  thread doSabatonRing(T);
  T += 0.58;
  thread doSabatonRing(T);
  T += 0.58;
  thread doSabatonRing(T);
  T += 0.58;
  thread doSabatonRing(T);
   T += 0.58;
  thread doSabatonRing(T);

  T = 52.65;
  thread doSabatonRingSmall(T, 31, 0.35);

  T = 65.27;
  thread doSabatonRing(T);

  T = 76.20;
  thread doSabatonLineSequential("x", 1, T, 0.1, 0);
  T += 0.4;
  thread doSabatonLineSequential("x", 2, T, 0.1, 0);
  T += 0.4;
  thread doSabatonLineSequential("x", 3, T, 0.1, 0);

  T = 77.83;
  thread doSabatonRing(T);

  T = 84;
  thread doSabatonTopSequential(T);

  T = 87.96;
  thread doSabatonLineSequential("x", 2, T, 0.1, 0);
  thread doSabatonLineSequential("x", 3, T, 0.1, 0);
  T += 0.3;
  thread doSabatonLineSequential("x", 1, T, 0.1, 0);
  thread doSabatonLineSequential("x", 4, T, 0.1, 0);

  T += 0.3;
  thread doSabatonLineSequential("x", 0, T, 0.1, 0);
  thread doSabatonLineSequential("x", 5, T, 0.1, 0);

  T = 88.76;
  thread doSabatonRing(T);
  T += 0.50;
  thread doSabatonRing(T);
  T += 0.56;
  thread doSabatonRing(T);
  T += 0.56;
  thread doSabatonRing(T);
  T += 0.61;
  thread doSabatonRing(T);
  T += 0.84;
  thread doSabatonRing(T);
  thread doSabatonChorusSection(T);

  T = 104.47;
  thread doSabatonRingSmall(T, 23.34, 0.35);

  T = 116.95;
  thread doSabatonRing(T);

  T = 128.00;
  thread doSabatonLineSequential("y", 2, T, 0.1, 0);
  T += 0.1;
  thread doSabatonLineSequential("y", 3, T, 0.1, 0);
  T += 0.3;
  thread doSabatonLineSequential("y", 1, T, 0.1, 0);
  T += 0.3;
  thread doSabatonLineSequential("y", 4, T, 0.1, 0);
  T += 0.3;
  thread doSabatonLineSequential("y", 0, T, 0.1, 0);
  thread doSabatonLineSequential("y", 5, T, 0.1, 0);

  T = 129.50;
  thread doSabatonRing(T);
  T += 0.28;
  thread doSabatonRingSmall(T, 5.98, 0.35);

  T = 135.74;
  thread doSabatonTopSequential(T, "anticlockwise");

  T = 139.64;
  thread doSabatonLineSequential("y", 4, T, 0.1, 0);
  T += 0.20;
  thread doSabatonLineSequential("y", 3, T, 0.1, 0);
  T += 0.20;
  thread doSabatonLineSequential("y", 2, T, 0.1, 0);
  T += 0.20;
  thread doSabatonLineSequential("y", 1, T, 0.1, 0);

  T = 140.55;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);
  T += 0.53;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);
  T += 0.65;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);
  T += 0.57;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);
  T += 0.59;
  thread doSabatonRingSmall(T);
  thread doSabatonRing(T);

  T = 143.19;
  thread doSabatonLineSequential("y", 1, T, 0.05, 0);
  T += 0.10;
  thread doSabatonLineSequential("y", 2, T, 0.05, 0);
  T += 0.10;
  thread doSabatonLineSequential("y", 3, T, 0.05, 0);
  T += 0.10;
  thread doSabatonLineSequential("y", 4, T, 0.05, 0);

  T = 143.61;
  thread doSabatonChorusSection(T);

  T = 156.14;
  thread doSabatonChorusSection(T);

  T = 168.70;
  thread doSabatonAllFiresLoop(T, 0.58, 7.5);

  T = 169;
  thread playEffect("party_sabaton_smoke", center_orig_top, T, 3, 0.7);
}

doSabatonRing(wait_before, duration, repeat_delay) {
  center_orig_top = strTok("fx_center", "|");
  thread playEffect("party_sabaton_fire_big_ring", center_orig_top, wait_before, duration, repeat_delay);
}

doSabatonRingSmall(wait_before, duration, repeat_delay) {
  center_orig_top = strTok("fx_center", "|");
  thread playEffect("party_sabaton_fire_small_ring", center_orig_top, wait_before, duration, repeat_delay);
}

doSabatonAllGroundFires(wait_before, duration, repeat_delay) {
  center_orig = strTok("fx_center_bottom", "|");
  thread playEffect("party_sabaton_fire_all_ground", center_orig, wait_before, duration, repeat_delay); 
}

doSabatonAllFiresLoop(wait_before, repeat_delay, duration) {
  T = wait_before;
  thread doSabatonRingSmall(T, duration, repeat_delay);
  thread doSabatonRing(T, duration, repeat_delay);
  thread doSabatonAllGroundFires(T, duration, repeat_delay);
}

doSabatonChorusSection(wait_before) {
  T = wait_before;
  thread doSabatonRingSmall(T, 11, 0.35);
  thread doSabatonRing(T);
  T += 1.49;
  thread doSabatonRing(T);
  T += 1.64;
  thread doSabatonRing(T);
  T += 1.56;
  thread doSabatonRing(T);
  T += 1.66;
  thread doSabatonRing(T);
  T += 1.46;
  thread doSabatonRing(T);
  T += 1.65;
  thread doSabatonRing(T); 
  T += 1.50;
  thread doSabatonLine("x", 1, T, 0);
  T += 0.45;
  thread doSabatonLine("x", 4, T, 0);
  T += 0.39;
  thread doSabatonLine("x", 2, T, 0);
  thread doSabatonLine("x", 3, T, 0);
  T += 0.42;
  thread doSabatonLine("x", 0, T, 0);
  thread doSabatonLine("x", 1, T, 0);
  thread doSabatonLine("x", 2, T, 0);
  thread doSabatonLine("x", 3, T, 0);
  thread doSabatonLine("x", 4, T, 0);
  thread doSabatonLine("x", 5, T, 0);
}

doSabatonTopSequential(wait_before, direction) {
  if(!isdefined(direction))
    direction = "clockwise";
  
  if(direction == "clockwise")
    indexes = strTok("1,2,3,4,5,6,7,1,2,3,4", ",");
  else
    indexes = strTok("7,6,5,4,3,2,1,7,6,5,4", ",");


  T = wait_before;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[0], "|"), T, 0);
  T += 0.38;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[1], "|"), T, 0);
  T += 0.39;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[2], "|"), T, 0);
  T += 0.38;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[3], "|"), T, 0);
  T += 0.39;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[4], "|"), T, 0);
  T += 0.39;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[5], "|"), T, 0);
  T += 0.38;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[6], "|"), T, 0);
  T += 0.40;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[7], "|"), T, 0);
  T += 0.38;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[8], "|"), T, 0);
  T += 0.39;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[9], "|"), T, 0);
  T += 0.39;
  thread playEffect("party_sabaton_fire_big", strTok("pit_side_top_"+indexes[10], "|"), T, 0);
}

doSabatonLineSequential(axis, index, wait_before, wait_between, duration) {
  //Spawns line of effects on the chosen axis and origin index sequentially
  // wait_between - how long to wait after another effect in the row is spawned
  origin_name = "pit_bottom_"+axis+"_"+index;
  fx_positions = _getLineFxPositions(axis, index);

  repeat_delay = 0.3;
  T = wait_before;
  for(i=0; i<fx_positions.size; i++) {
    level thread _playEffectAtPosition("party_sabaton_fire_small", fx_positions[i], undefined, T, duration, repeat_delay);
    T += wait_between;
  }
}

doSabatonLines(axis, index_from, index_to, wait_before, pause_between) {
  duration = 0.5;
  start_after = wait_before;
  for(i=0; i<6; i++) {
    thread doSabatonLine(axis, i, start_after, duration);
    start_after += pause_between;
  }
}

doSabatonLine(axis, index, wait_before, duration, repeat_delay) {
  //Spawns line of effects on the chosen axis and origin index
  origin_name = "pit_bottom_"+axis+"_"+index;
  fx_positions = _getLineFxPositions(axis, index);

  if(!isdefined(repeat_delay))
    repeat_delay = 0.3;

  for(i=0; i<fx_positions.size; i++)
    level thread _playEffectAtPosition("party_sabaton_fire_small", fx_positions[i], undefined, wait_before, duration, repeat_delay);
}

_getLineFxPositions(axis, index) {
  FX_DISTANCE = 180;  // Distance between the effects on the row
  count = _getFxCountPerLine(axis, index);
  
  origin = getent("pit_bottom_"+axis+"_"+index, "targetname").origin;
  if(axis == "x")
    starting_point = origin[1];
  else
    starting_point = origin[0];

  positions = [];
  edge = starting_point + ((count - 1) / 2) * FX_DISTANCE; // Edge position of this row
  for(i=0; i<count; i++) {
    position_axis = edge - i * FX_DISTANCE;
    if(axis == "x")
      new_pos = (origin[0], position_axis, origin[2]);
    else
       new_pos = (position_axis, origin[1], origin[2]);
    positions[positions.size] = new_pos;
  }
  return positions;

}

_getFxCountPerLine(axis, index) {
  // Returns number of effects that fit on the specific line
  if(index == 0 || index == 5)
    count = 2;
  else if(index == 1 || index == 4)
    count = 4;
  else
    count = 5;
  return count;
}

initBeams() {
  hideCenterBeams();
  hideWooferBeams();
  
  // Move beams to their place (they initally spawn elsewhere to make them lit properly)
  for(i=0; i<8; i++) {
    beam = getent("beam_woofer_"+i, "targetname");
    beam moveZ(1024, 0.05);
    wait 0.3;
    beam moveY(-1480, 0.05);
    wait 0.3;
  }

  colors = strTok("yellow|blue|purple", "|");
  for(i=0; i<colors.size; i++) {
    beam = getent("beams_center_"+colors[i], "targetname");
    beam moveZ(1024, 0.05);
    wait 0.3;
    beam moveY(-1480, 0.05);
    wait 0.3;
  }
}

hideWooferBeams() {
  for(i=0; i<8; i++) {
    beam = getent("beam_woofer_"+i, "targetname");
    beam hide();
  }
}

hideCenterBeams() {
  beams = getent("beams_center_blue", "targetname") hide();
  beams = getent("beams_center_yellow", "targetname") hide();
  getent("beams_center_purple", "targetname") hide();
}

prepareWoofers() {
  colors = strTok("purple|yellow|red", "|");
  for(i=0; i<colors.size; i++)
  {
    for(j=0; j<8; j++) {
      woofer = getent("woofer_"+colors[i]+"_"+j, "targetname");
      target = getent("woofer_"+j+"_orig", "targetname");
      if(!isdefined(woofer))
        continue;
      woofer hide();
      woofer moveTo(target.origin, 0.05);
    }
  }
}

switchOnWoofer(color, index, wait_before) {
  // Replace currently active woofer at the index by the one with the color
  if(!isdefined(wait_before))
    wait_before = 0;

  wait wait_before;

  if(!isdefined(level.cly["music_player"]["woofers"][index]))
    level.cly["music_player"]["woofers"][index] = "black";
  
  active_color = level.cly["music_player"]["woofers"][index];
  active_woofer = getent("woofer_"+active_color+"_"+index, "targetname");
  new_woofer = getent("woofer_"+color+"_"+index, "targetname");

  if(isdefined(active_woofer))
    active_woofer hide();
  if(isdefined(new_woofer))
    new_woofer show();

  level.cly["music_player"]["woofers"][index] = color;
}

doDreamerWoofers() {
  duration = level.cly["music_player"]["track_durations"]["dreamer"];
  thread switchOnWoofer("purple", 0, 10.3);
  thread switchOnWoofer("purple", 7, 10.3);

  thread switchOnWoofer("purple", 1, 11.73);

  thread switchOnWoofer("purple", 6, 12.62);

  thread switchOnWoofer("purple", 2, 15.39);
  thread switchOnWoofer("purple", 5, 15.39);

  thread switchOnWoofer("purple", 3, 16.8);

  thread switchOnWoofer("purple", 4, 17.77);
  wait duration + 3;
  for(i=0; i<8; i++) {
    thread switchOnWoofer("black", i);
  }
}

initFloor() {
  getent("party_retro_floor_left", "targetname") hide();
  getent("party_retro_floor_right", "targetname") hide();
  getent("party_retro_side_panels", "targetname") hide();
}

getSelectedTrack() {
  return level.cly["music_player"]["track"];
}

initMusicPlayer() {
  level.cly["music_player"] = [];

  level.cly["music_player"]["time_left"] = 0;
  level.cly["music_player"]["track_list"] = [];
  level.cly["music_player"]["track_durations"] = [];
  level.cly["music_player"]["found_tracks"] = [];  // List of track names found by players
  level.cly["music_player"]["found_tracks"]["cancel"] = true;
  
  // Add tracks, their full names and their duration
  track0_id = "cancel";
  level.cly["music_player"]["track_list"][0] = track0_id;
  level.cly["music_player"]["full_names"][track0_id] = &"MEM_PARTY_MENU_CANCEL";
  level.cly["music_player"]["track_durations"][track0_id] = 0;

  track1_id = "dreamer";
  level.cly["music_player"]["track_list"][1] = track1_id;
  level.cly["music_player"]["full_names"][track1_id] = &"MEM_PARTY_TRACK_DREAMER";
  level.cly["music_player"]["track_durations"][track1_id] = 242;
  
  track2_id = "rainbow";
  level.cly["music_player"]["track_list"][2] = track2_id;
  level.cly["music_player"]["full_names"][track2_id] = &"MEM_PARTY_TRACK_RAINBOW";
  level.cly["music_player"]["track_durations"][track2_id] = 184;


  track3_id = "cheri";
  level.cly["music_player"]["track_list"][3] = track3_id;
  level.cly["music_player"]["full_names"][track3_id] = &"MEM_PARTY_TRACK_CHERI";
  level.cly["music_player"]["track_durations"][track3_id] = 227;

  track4_id = "sabaton";
  level.cly["music_player"]["track_list"][4] = track4_id;
  level.cly["music_player"]["full_names"][track4_id] = &"MEM_PARTY_TRACK_SABATON";
  level.cly["music_player"]["track_durations"][track4_id] = 192;

  // -------------------------------

  level.cly["music_player"]["woofers"] = [];
  level.cly["music_player"]["floor"] = "blue";

  ysize = 20;

  for(i=0; i<level.cly["music_player"]["track_list"].size; i++) {
    menu_item = [];
    menu_item["id"] = level.cly["music_player"]["track_list"][i];
    menu_item["text"] = &"MEM_PARTY_MENU_NOT_AVAILABLE";
    menu_item["x"] = 0;
    menu_item["y"] = ysize * i;
    menu_item["xsize"] = 0;
    menu_item["ysize"] = ysize;
    level.cly["music_player"]["menu"][i] = menu_item;
  }

  thread initTimeLeftCountdown(); 
}

initTimeLeftCountdown() {
  // Counts down time until the currently playing track stops
  slider = getent("party_slider", "targetname");
  while(1) {
    level waittill("music_playing");
    slider moveX(-72, getTimeLeft());

    while(getTimeLeft() > 0) {
      wait 1;
      setTimeLeft(getTimeLeft() - 1);
    }
    level notify("music_stopped");
    slider moveX(72, 0.1);
  }
}

setTimeLeft(time_left) {
  level.cly["music_player"]["time_left"] = time_left;
}

getTimeLeft() {
  // Number of seconds remaining to the end of currently played track
  return level.cly["music_player"]["time_left"];
}

isMusicPlaying() {
  if(level.cly["music_player"]["time_left"] > 0)
    return true;
  return false;
}

initMenu() {
  trig = getent("enter_menu", "targetname");  

  while(1) {
    trig waittill("trigger", player);
    if(player pIsInCooldown()) {
      player iprintlnbold("Try again in " + player.cly["PLAYER_COOLDOWN"]+ " seconds");
      continue;
    }
    trig setCursorHint("HINT_NONE");
    
    player enterMenu();
    // Player may not be defined anymore if disconnected while in the menu
    if(getTimeLeft() > 1) {
      if(isdefined(player))
        player pResetMenuAbuseCount(); 
      level waittill("music_stopped");
      updatePlayingTrack();
    }
    else if(isdefined(player) && player pShouldGetCooldown()) {
      // Player didn't start any track several times in a row and is potentially blocking the DJ deck -> give him cooldown
      player thread pSetCooldown();
      player pResetMenuAbuseCount();
    }
    wait 0.1;
    trig setCursorHint("HINT_ACTIVATE");
  }
}

pIsInCooldown() {
  return isdefined(self.cly) && isdefined(self.cly["PLAYER_COOLDOWN"]) && self.cly["PLAYER_COOLDOWN"] > -1;
}

pResetMenuAbuseCount() {
  if(!isdefined(self.cly))
    self.cly = [];
  self.cly["MENU_ABUSE_COUNT"] = 0;
}

pShouldGetCooldown() {
  if(!isdefined(self.cly))
    self.cly = [];
  if(!isdefined(self.cly["MENU_ABUSE_COUNT"])) {
    self.cly["MENU_ABUSE_COUNT"] = 1;
    return false;
  }
  self.cly["MENU_ABUSE_COUNT"] += 1;

  if(self.cly["MENU_ABUSE_COUNT"] == level.cly["MAX_MENU_ABUSE_COUNT"]) 
    return true;

  return false;
}

hideTracks() {
  for(i=0; i<level.cly["music_player"]["track_list"].size; i++) {
    track_name = level.cly["music_player"]["track_list"][i];
    ents = getentarray("party_track_choice_"+track_name, "targetname");

    for(j=0; j<ents.size; j++)
      ents[j] hide();
  }
}

updateMenuItems() {
  for(i=0; i<level.cly["music_player"]["menu"].size; i++) {
    track_id = level.cly["music_player"]["menu"][i]["id"];

    if(isdefined(level.cly["music_player"]["found_tracks"][track_id]))
      level.cly["music_player"]["menu"][i]["text"] = level.cly["music_player"]["full_names"][track_id];
  }
}

startMenuCountdown() {
  // Countsdown time the DJ menu can be open
  self endon("menu_closed");
  self endon ("disconnect");
  self endon ("player_reset");

  level.cly["MENU_TIME_LEFT"] = level.cly["MENU_TIME_LIMIT"];
  while(level.cly["MENU_TIME_LEFT"] > -1) {
    wait 1;
    level.cly["MENU_TIME_LEFT"] -= 1;
  }
}

pSetCooldown(wait_before) {
  self endon("disconnect");
  self endon("player_reset");

  self.cly["PLAYER_COOLDOWN"] = level.cly["PLAYER_COOLDOWN"];
  
  if(isdefined(wait_before))
    wait wait_before;

  while(self.cly["PLAYER_COOLDOWN"] > -1) {
    wait 1;
    self.cly["PLAYER_COOLDOWN"] -= 1;
  }  
}

enterMenu() {
  // Thx Kung foo man, Serthy and IzNoGoD for the concept idea; source: https://killtube.org/showthread.php?1286-Quickmenu-without-menu-D
  self endon("disconnect");
  self endon("player_reset");
  
  self.cly["selected_item"] = 0;
  self.cly["quickhud_string"] = [];
  self.cly["quickhud_shader"] = [];

  // Add tracks found by this player which are not there yet
  putTracks(self);

  updateMenuItems();
  
  player_angles = self getPlayerAngles();
  menu_angles = player_angles;

  self.cly["quickhud_title"] = newMenuTitleHud(self);
  self.cly["quickhud_helper"] = newMenuHelperHud(self);
  self.cly["quickhud_timer"] = newMenuTimerHud(self);
  for(i=0; i<level.cly["music_player"]["menu"].size; i++) {
    self.cly["quickhud_string"][i] = newMenuStringHud(self, level.cly["music_player"]["menu"][i]["x"], level.cly["music_player"]["menu"][i]["y"], i);
    self.cly["quickhud_shader"][i] = newMenuShaderHud(self, level.cly["music_player"]["menu"][i]["x"], level.cly["music_player"]["menu"][i]["y"]);
  }

  active_item = 0;
  self setActiveItem(active_item);
  self thread startMenuCountdown();

  while(!self attackButtonPressed() && level.cly["MENU_TIME_LEFT"] > -1 && isAlive(self)) {
    menu_angles = self getPlayerAngles();
    self updateMenuTimer();		

    if(menu_angles != player_angles) {
      m_angles = [];
      m_angles["x"] = cos(menu_angles[1]) * 120 - 20;
      m_angles["y"] = sin(menu_angles[0]) * 120 - 20;
      
      found_item = findSelectedItem(m_angles);
      if(isdefined(found_item)) {
        setActiveItem(found_item);
        active_item = found_item;
      }		
    }
    player_angles = menu_angles;
    wait 0.1;
  }

  self cleanUpMenu();
  self notify("menu_closed");

  if(level.cly["MENU_TIME_LEFT"] < 0 || !isAlive(self))
    return;

  track_id = level.cly["music_player"]["track_list"][active_item];
  if(!isdefined(level.cly["music_player"]["found_tracks"][track_id]) || track_id == "cancel") {
    return;
  }

  updatePlayingTrack(track_id);

  self thread pSetCooldown(level.cly["music_player"]["track_durations"][track_id]);

  self iprintln(&"MEM_PARTY_PLAYING", level.cly["music_player"]["full_names"][track_id]);
  
  // Countdown to the start
  for(i=5; i>0; i--) {
    self iprintlnbold(i);
    wait 1;
  }
  startTheShow(track_id);
}

updateMenuTimer() {
  self.cly["quickhud_timer"] setValue(level.cly["MENU_TIME_LEFT"]);
  if(level.cly["MENU_TIME_LEFT"] < 5)
    self.cly["quickhud_timer"].color = (1, 0, 0);
}

findSelectedItem(mouse) {
  items = level.cly["music_player"]["menu"];
  for(i = 0; i < items.size; i++) {
    if(mouse["y"] > items[i]["y"] && mouse["y"] <= items[i]["y"] + items[i]["ysize"]) {
      return i;
    }
  }
  return undefined;
} 

setActiveItem(item_id) {
  id = self.cly["selected_item"];

  self.cly["quickhud_string"][id].color = ( 1 , 1 , 1 );
  self.cly["quickhud_string"][id].fontscale = 1;

  self.cly["quickhud_shader"][id].color = (0.015, 0.145, 0.662);
  self.cly["quickhud_shader"][id].alpha = 0.2;

  self.cly["selected_item"] = item_id;

  self.cly["quickhud_string"][item_id].color = ( 1, 1, 1 );
  self.cly["quickhud_string"][item_id].fontscale = 1;

  self.cly["quickhud_shader"][item_id].color = ( 0.258, 1, 0.160 );
  self.cly["quickhud_shader"][item_id].alpha = 0.5;
}

newMenuTimerHud(player) {
  hud = newClientHudElem(player);
  hud.x = 160;
  hud.y = -20;
  hud.horzAlign = "center";
  hud.vertAlign = "middle";
  hud.alignX = "center";
  hud.alignY = "middle";
  hud.fontscale = 1;
  hud.color = ( 1, 0.69, 0.27 );
  hud.alpha = 0.9;
  hud setValue(level.cly["MENU_TIME_LIMIT"]);
  return hud;
}

newMenuSelectedTrackHud(player, full_track_name) {
  hud = newClientHudElem(player);
  hud.x = 0;
  hud.y = -40;
  hud.horzAlign = "center";
  hud.vertAlign = "middle";
  hud.alignX = "center";
  hud.alignY = "middle";
  hud.fontscale = 1.5;
  hud.color = ( 0.258, 1, 0.160 );
  hud.alpha = 0.9;
  hud setText(&"Loading track: "+ full_track_name);
  return hud;
}

newMenuTitleHud(player) {
  hud = newClientHudElem(player);
  hud.x = 0;
  hud.y = -40;
  hud.horzAlign = "center";
  hud.vertAlign = "middle";
  hud.alignX = "center";
  hud.alignY = "middle";
  hud.fontscale = 1.5;
  hud.color = ( 0.258, 1, 0.160 );
  hud.alpha = 0.9;
  hud setText(&"MEM_PARTY_MENU_SELECT");
  return hud;
}

newMenuHelperHud(player) {
  hud = newClientHudElem(player);
  hud.x = 0;
  hud.y = -25;
  hud.horzAlign = "center";
  hud.vertAlign = "middle";
  hud.alignX = "center";
  hud.alignY = "middle";
  hud.fontscale = 0.75;
  hud.color = ( 0.258, 1, 0.160 );
  hud.alpha = 0.9;
  hud setText(&"MEM_PARTY_MENU_HELPER");
  return hud;
}

newMenuStringHud(player, x, y, item_id) {
  hud = newClientHudElem( player );
  hud.x = x;
  hud.y = y;
  hud.horzAlign = "center";
  hud.vertAlign = "middle";
  hud.alignX = "center";
  hud.alignY = "middle";
  hud setText(level.cly["music_player"]["menu"][item_id]["text"]);

  return hud;
}

newMenuShaderHud(player, x, y) {
  w = 350;
  h = 20;

  hud = newClientHudElem( player );
  hud.x = x - ( w * 0.5 );
  hud.y = y - ( h * 0.5 );
  hud.horzAlign = "center";
  hud.vertAlign = "middle";
  hud.color = (0.015, 0.145, 0.662);
  hud.alpha = 0.2;
  hud setShader( "white" , w , h );

  return hud;
}

cleanUpMenu() {
  if(isDefined(self.cly) && isDefined(self.cly["quickhud_string"]))
  {
    for(i=0; i<self.cly["quickhud_string"].size; i++)
    {
      self.cly["quickhud_string"][i] destroy();
      self.cly["quickhud_shader"][i] destroy();
    }
    self.cly["quickhud_title"] destroy();
    self.cly["quickhud_helper"] destroy();
    self.cly["quickhud_timer"] destroy();

    self.cly["quickhud_string"] = undefined;
    self.cly["quickhud_shader"] = undefined;
    self.cly["quickhud_title"] = undefined;
    self.cly["quickhud_helper"] = undefined;
    self.cly["quickhud_timer"] = undefined;
  }
}

updatePlayingTrack(track_id) {

  if(!isdefined(track_id)) {
    // Unselect track
    if(isdefined(level.cly["music_player"]["playing_track"])) {
      track = getentarray("party_track_choice_" + level.cly["music_player"]["playing_track"], "targetname");
      for(i=0; i<track.size; i++) {
        if(track[i].script_noteworthy == "selected")
          track[i] hide();
        else
          track[i] show();
      }
      level.cly["music_player"]["playing_track"] = undefined;
    }
    return;
  }
  
  level.cly["music_player"]["playing_track"] = track_id;

  track = getentarray("party_track_choice_" + track_id, "targetname");
  for(i=0; i<track.size; i++) {
    if(track[i].script_noteworthy == "selected")
      track[i] show();
    else
      track[i] hide();
  }
}

menuOnDisconnect() {
  // Clean up menu while it's open and player disconnects
  self endon("menu_closed");
  self waittill("disconnect");

  self cleanUpMenu();
}


initTrackPickupTrig() {
  trigs = getentarray("party_track_pickup_trig", "targetname");
  
  for(i=0; i<trigs.size; i++) {
    trigs[i] thread trackPickupTrig();
  }
}

trackPickupTrig() {
  trig_name = "party_track_pickup_" + self.script_noteworthy;
  ent = getent(trig_name, "targetname");
  ent notSecretOnly(trig_name);
  
  while(1) {
    self waittill("trigger", player);
    if(!player hasSecret(trig_name)) {
      player addSecret(trig_name);
    }
  }
}

putTracks(player) {
  put_tracks_count = _putTracks(player);
  missing_tracks_count = getMissingTracksCount();
  
  if(put_tracks_count > 0) {
    if(missing_tracks_count == 0) {
      level notify("all_tracks_found", player);
    }
  }
  return put_tracks_count;
}

_putTracks(player) {
  //Places tracks on the DJ decks and returns their amount 
  put_tracks = 0;
  
  for(i=0; i<level.cly["music_player"]["track_list"].size; i++) {
    track_name = level.cly["music_player"]["track_list"][i];
    trig_name = "party_track_pickup_"+track_name;
  
    if(player hasSecret(trig_name) && !isdefined(level.cly["music_player"]["found_tracks"][track_name])) {
      level.cly["music_player"]["found_tracks"][track_name] = true;
      put_tracks++;
      ents = getEntArray("party_track_choice_"+track_name, "targetname");
      for(j=0; j<ents.size; j++) {
        if(ents[j].script_noteworthy == "inventory")
          ents[j] show();
      }
    }
  }
  return put_tracks;
}

getMissingTracksCount() {
  return level.cly["music_player"]["track_list"].size - level.cly["music_player"]["found_tracks"].size;
}

showSelectedTrack(name) {
  ents = getEntArray("party_track_choice_"+name, "targetname");
  for(i=0; i<ents.size; i++) {
    if(ents[i].script_noteworthy == "selected")
      ents[i] show();
    else
      ents[i] hide();
  }
  wait 5;
  
  for(i=0; i<ents.size; i++) {
    if(ents[i].script_noteworthy == "inventory")
      ents[i] show();
    else
      ents[i] hide();
  }
}

startTheShow(track_id) {
  switch(track_id) {
    case "dreamer":
      playDreamer();
      break;
    case "rainbow":
      playRainbow();
      break;
    case "cheri":
      playCheri();
      break;
    case "sabaton":
      playSabaton();
      break;
  }
}

playCheri() {
  track_id = "cheri";
  duration = level.cly["music_player"]["track_durations"][track_id];

  setTimeLeft(duration);
  thread startMusic(track_id);
  thread doCheriFx();
}

doCheriFx() {
  thread doCheriStage();

  thread playEffect("party_cheri_floor4", strTok("fx_ball", "|"), 4.28, 8, 4);

  thread doCheriSmallSides(12.67);
  thread playEffect("party_cheri_smoke", strTok("fx_center", "|"), 10.55, 1, 0.5);

  thread playEffect("party_cheri_floor2b", strTok("fx_ball", "|"), 4.28+8.39, 212, 1);

  T_neons = 12.67;
  neons_wait = 0.51;

  thread playEffect("party_cheri_floor5", strTok("fx_ball", "|"), 20.42);

  T_chorus = 44.17;
  
  all_woofers = "woofer_top_0|woofer_top_1|woofer_top_2|woofer_top_3|woofer_top_4|woofer_top_5|woofer_top_6";

  thread playEffect("party_cheri_sides1b", strTok(all_woofers, "|"), T_chorus, 0, 0.3, true);
  thread playEffect("party_cheri_sides1c", strTok(all_woofers, "|"), T_chorus + 2, 38, 0.3, true);
  thread playEffect("party_cheri_sides1", strTok(all_woofers, "|"), T_chorus + 1, 35, 7, true);

  thread playEffect("party_cheri_smoke", strTok("fx_center", "|"), 87, 1, 0.5);

  thread doCheriSmallSides(90.34);

  thread playEffect("party_cheri_floor5", strTok("fx_ball", "|"), 98);


  T_chorus2 = 121.85;
  thread playEffect("party_cheri_sides1b", strTok(all_woofers, "|"), T_chorus2, 0, 0.3, true);
  thread playEffect("party_cheri_sides1c", strTok(all_woofers, "|"), T_chorus2 + 2, 38, 0.3, true);
  thread playEffect("party_cheri_sides2", strTok(all_woofers, "|"), T_chorus2 + 1, 35, 7, true);

  thread doCheriSmallSides(163.97);
  thread doCheriSmallSides(172.36);

  T_chorus3 = 178.65;
  thread playEffect("party_cheri_sides3b", strTok(all_woofers, "|"), T_chorus3 + 1, 35, 0.3, true);
  
  thread playEffect("party_cheri_snow", strTok("fx_ball", "|"), T_chorus3 + 1.5, 30, 7);
}

doCheriSmallSides(wait_before) {
  // Play small_sides effect. Pick random start index ranging from 0 to 6 (included).
  wait wait_before;
  woofer_index = randomIntRange(0, 7);

  for(i=0; i<12; i++) {
    playEffect("party_cheri_sides_small", strTok("woofer_top_"+woofer_index, "|"), 0, 0, 0.3, true);
    woofer_index = (woofer_index + 1) % 7;
    if(i == 9)
      wait_time = 1.59;
    else
      wait_time = 0.51;

    wait wait_time;
  }
}

prepareFloors() {
  colors = strTok("red|pink", "|");
  for(i=0; i<colors.size; i++)
  {
    floor_name = "floor_"+colors[i];
    floor = getent(floor_name, "targetname");
    target = getent("pit_side_0", "targetname");
    floor hide();
    floor moveTo(target.origin, 0.05);
  }
}

switchOnFloor(color, wait_before) {
  // Replace currently active floor at the index by the one with the color (index: <0; 4))
  if(!isdefined(wait_before))
    wait_before = 0;
  
   wait wait_before;
  
  active_color = level.cly["music_player"]["floor"];
  active_floor = getent("floor_"+active_color, "targetname");
  new_floor = getent("floor_"+color, "targetname");

  active_floor hide();
  new_floor show();

  level.cly["music_player"]["floor"] = color;
}

doCheriStage() {
  duration = level.cly["music_player"]["track_durations"]["cheri"];
  // We only want origins at indexes 0,2,4,6
  thread switchOnFloor("pink", 0.5);
  
  // All the woofers are 1 entity with targetname woofer_yellow_0 
  // but the currently active woofers are not, thus, they need to be replaced one by one
  for(i=0; i<8; i++)
    thread switchOnWoofer("yellow", i, 0.5);
  wait duration + 3;
  
  thread switchOnFloor("blue");
  
  for(i=0; i<8; i++)
    thread switchOnWoofer("black", i);
}

playRainbow() {
  duration = level.cly["music_player"]["track_durations"]["rainbow"];
  if(getTimeLeft() > 0)
    return;  // Should never happen
  setTimeLeft(duration);
  thread startMusic("rainbow");
  thread doRainbowFx();
  
}

doRainbowFx() {
  origins_x = [];
  origins_y = [];

  thread playEffect("party_blue_neon_vert_fadein", strTok("pit_bottom_x_1|pit_bottom_x_2|pit_bottom_x_3|pit_bottom_x_4|pit_bottom_x_5", "|"), 2.74);
  thread playEffect("party_blue_neon_horiz_fadein", strTok("pit_bottom_y_1|pit_bottom_y_2|pit_bottom_y_3|pit_bottom_y_4|pit_bottom_y_5", "|"), 2.74);
  
  period_length = 7.515;
  thread playEffect("party_blue_ball", strTok("fx_center_bottom", "|"), 10.22);
  thread playEffect("party_blue_ball", strTok("pit_bottom_x_1", "|"), 10.22 + period_length);
  thread playEffect("party_rainbow_particles_3", strTok("fx_ball", "|"), 10.22 + period_length + 5, 15);
  thread playEffect("party_blue_ball", strTok("pit_bottom_y_1", "|"), 10.22 + 2 * period_length);
  thread playEffect("party_blue_ball", strTok("pit_bottom_y_4", "|"), 10.22 + 3 * period_length);
  thread playEffect("party_rainbow_particles_3_bottom", strTok("fx_ball", "|"), 10.22 + 3 * period_length + 3, 18);
  thread playEffect("party_rainbow_particles_4", strTok("fx_ball", "|"), 10.22 + 5 * period_length - 2, 20);
  thread playEffect("party_rainbow_particles_5", strTok("fx_ball", "|"), 10.22 + 5 * period_length + 4, 17);
 
  thread playMovingFx("party_rainbow_particles_6_sphere", "fx_ball", "z", 180, 10, 10.22 + 8 * period_length - 1, 10);
  thread playMovingFx("party_rainbow_particles_6_particles", "fx_ball", "z", 180, 10, 10.22 + 8 * period_length - 1, 8);

  thread playEffect("party_rainbow_particles_7", strTok("fx_ball", "|"), 10.22 + 9 * period_length + 4);

  wave_start = 10.22 + 10 * period_length - 0.5;
  thread playEffect("party_rainbow_particles_8", strTok("fx_ball", "|"), wave_start);
  thread playEffect("party_rainbow_particles_9", strTok("fx_ball", "|"), wave_start + 13.79);
  thread playEffect("party_rainbow_particles_10", strTok("fx_ball", "|"), wave_start + 29.67);
  thread playEffect("party_rainbow_particles_11", strTok("fx_ball", "|"), wave_start + 29.67 + 29.60);
}

playMovingFx(fx_id, place_targetname, move_axis, move_units, move_time, wait_before, duration, repeat_delay) {
  if(!isdefined(wait_before))
    wait_before = 0;
  if(!isdefined(repeat_delay))
    repeat_delay = 0.3;
  if(!isdefined(duration))
    duration = 0.01;  // Play once
  
  orig = getent(place_targetname, "targetname");
  target = spawn("script_model", orig.origin);
  target.origin = orig.origin;
  
  wait wait_before + 0.05;

  time_left = duration;
  switch(move_axis)
  {
    case "x":
      target moveX(move_units, move_time);
      break;
    case "y":
      target moveY(move_units, move_time);
      break;
    case "z":
      target moveZ(move_units, move_time);
      break;
  }
  while(time_left > 0)
  {
    PlayFX(level._effect[fx_id], target.origin);
    wait repeat_delay;
    time_left -= 0.3;
  }
  target delete();
}

playDreamer() {
  duration = level.cly["music_player"]["track_durations"]["dreamer"];
  if(getTimeLeft() > 0)
    return;  // Should never happen
  
  setTimeLeft(duration);

  thread doDreamerWooferBeams();

  thread doDreamerWoofers();
  thread startMusic("dreamer");
  thread playEffect("ball_purple", strTok("fx_ball", "|"), 19.70, 19.70, 0.3);
  thread makeRetroFloor();

  thread doCenterBeams("purple", 20.4, 20.12);
  thread playEffect("party_dreamer_smoke", strTok("fx_center", "|"), 20.4, 2);

  thread playEffect("ball_blue", strTok("fx_ball", "|"), 39.58, 20.20, 0.3);
  thread doCenterBeams("blue", 40.58, 20.20);

  thread playEffect("ball_yellow", strTok("fx_ball", "|"), 59.84, 20, 0.3);
  thread doCenterBeams("yellow", 60.84, 20);


  thread playEffect("ball_purple", strTok("fx_ball", "|"), 79.90, 60.65, 0.3);
  thread doCenterBeams("purple", 80.9, 60.65);

  thread playEffect("needles", strTok("fx_ball", "|"), 140.00, 21.46, 0.65);
  thread playEffect("party_dreamer_smoke", strTok("fx_center", "|"), 141.5, 2);


  thread playEffect("ball_yellow", strTok("fx_ball", "|"), 160.74, 20.20, 0.3);
  thread doCenterBeams("yellow", 161.74, 20.20);

  thread playEffect("ball_purple", strTok("fx_ball", "|"), 179.94, 54.46, 0.3);
  thread doCenterBeams("purple", 181.94, 50.46);
  
 thread playEffect("party_dreamer_smoke", strTok("fx_center", "|"), 202.15, 2);

 thread doDreamerNeons();
}


startMusic(name) {
  speakers = getentarray("fx_center", "targetname");
  setAmbient();
  speakers[0] playsound(name);

  if(isdefined(name))
    level notify("music_playing");
}

doCenterBeams(color, wait_before, duration) {
  beams = getent("beams_center_"+color, "targetname");
  rotations = duration / 10;
  extra_time = 0.1;
  wait wait_before - extra_time;
  beams rotateyaw(rotations * -360, duration + extra_time); // Beams will already be moving before they are shown to make it look smoother 
  wait extra_time;
  beams show();
  beams waittill("rotatedone");
  beams hide();
}


playEffect(fx_id, places, wait_before, duration, repeat_delay, use_angles) {
  /*
  Plays the effect at a static position.
  places - list of targetnames of script origins the effect should play at
  */
  level endon("music_stopped");

  if(!isDefined(duration))
    duration = 0;
  if(!isDefined(wait_before))
    wait_before = 0;
  if(!isDefined(repeat_delay))
    repeat_delay = 0.3;
  
  for(i=0; i<places.size; i++) {
    ents = getentarray(places[i], "targetname");

    for(j=0; j<ents.size; j++) {
      level thread _playEffectAtOrigin(fx_id, ents[j], wait_before, duration, repeat_delay, use_angles);
    }
  }
}

_playEffectAtOrigin(fx_id, origin, wait_before, duration, repeat_delay, use_angles) {
  if(isDefined(use_angles) && use_angles)
    angles = origin.angles;
  else
    angles = undefined;

  _playEffectAtPosition(fx_id, origin.origin, angles, wait_before, duration, repeat_delay);
}

_playEffectAtPosition(fx_id, position, angles, wait_before, duration, repeat_delay) {
  /*
  Plays the effect at a static position.
  fx_id - name of played effect; 
  position - position vector of the effect
  angles - angles at which the effect should play
  wait_before - the delay before playing the effect for the first time; default = 0
  duration - how long should the effect be played; waits until the effect completes; if blank, effect will play once
  repeat_delay - the delay between each effect loop; default = 0.3
  */
  wait wait_before;
  
  if(duration == 0) {
    if(isdefined(angles))
      playFX(level._effect[fx_id], position, anglesToForward(angles), anglesToUp(angles));
    else
      playFX(level._effect[fx_id], position);
  }
  else {
    if(isdefined(angles)) {
      looper = playLoopedFX(level._effect[fx_id], repeat_delay, position, 0, anglesToForward(angles), anglesToUp(angles));
    }
    else {
      looper = playLoopedFX(level._effect[fx_id], repeat_delay, position);
    }
    looper thread fxOnMusicStop();

    wait duration;
    looper delete();
  }
}
fxOnMusicStop() {
  // Used on fx loopers when the music is stopped. Kills all the party effects.
  self endon("deleted");
  level waittill("music_stopped");
  if(isdefined(self))
    self delete();
}

makeRetroFloor() {
  song_duration = level.cly["music_player"]["track_durations"]["dreamer"];

  bottom_l = getent("party_retro_floor_left", "targetname");
  bottom_r = getent("party_retro_floor_right", "targetname");
  sides = getent("party_retro_side_panels", "targetname");
  bottom_l show();
  bottom_r show();
  sides show();

  bottom_l moveX(-544, 7.75);
  bottom_r moveX(544, 7.75);
  sides moveZ(171, 7.75);

  wait(song_duration - 5);

  bottom_l moveX(544, 7);
  bottom_r moveX(-544, 7);
  sides moveZ(-171, 7);
  wait 8;

  bottom_l hide();
  bottom_r hide();
  sides hide();

}

doDreamerDrums() {
  origs = [];
  origs[0] = getent("woofer_top_0", "targetname");
  origs[1] = getent("woofer_top_1", "targetname");
  origs[2] = getent("woofer_top_2", "targetname");
  origs[3] = getent("woofer_top_3", "targetname");
  origs[4] = getent("woofer_top_4", "targetname");
  origs[5] = getent("woofer_top_5", "targetname");
  
  playloopedFX(level._effect["ball_shot"], 0.3, origs[0].origin, 0, anglesToForward(origs[0].angles), anglesToUp(origs[0].angles));
  wait 0.1;
  playloopedFX(level._effect["ball_shot"], 0.3, origs[1].origin, 0, anglesToForward(origs[1].angles), anglesToUp(origs[1].angles));
  wait 0.3;
  playloopedFX(level._effect["ball_shot"], 0.3, origs[2].origin, 0, anglesToForward(origs[2].angles), anglesToUp(origs[2].angles));
  wait 0.1;
  playloopedFX(level._effect["ball_shot"], 0.3, origs[3].origin, 0, anglesToForward(origs[3].angles), anglesToUp(origs[3].angles));
  wait 0.1;
  playloopedFX(level._effect["ball_shot"], 0.3, origs[4].origin, 0, anglesToForward(origs[4].angles), anglesToUp(origs[4].angles));
  wait 0.1;
  playloopedFX(level._effect["ball_shot"], 0.3, origs[5].origin, 0, anglesToForward(origs[5].angles), anglesToUp(origs[5].angles));
}

doDreamerWooferBeams() {
   beams = [];
  for(i=0; i<8; i++) {
    beam = getent("beam_woofer_"+i, "targetname");
    beams[beams.size] = beam;
  }

  wait 19.5;
  beams[0] show();
  wait 0.16;
  beams[4] show();
  wait 0.16;
  beams[1] show();

  wait 0.16;

  beams[5] show();
  wait 0.16;
  beams[2] show();
  wait 0.16;
  beams[6] show();

  wait 0.3;

  for(i=0; i<8; i++)
    beams[i] hide();

}

doDreamerPitBlueBeams() {
   beams = [];
  for(i=0; i<8; i++) {
    beam = getent("beam_pit_blue_"+i, "targetname");
    beams[beams.size] = beam;
  }

  wait 29.42;
  beams[2] show();
  wait 0.16;
  beams[6] show();
  wait 0.16;
  beams[3] show();
  wait 0.16;
  beams[7] show();
  wait 0.16;
  beams[4] show();
  wait 0.16;
  beams[0] show();
  wait 0.3;
  for(i=0; i<8; i++)
    beams[i] hide();
}

doDreamerWooferDrums() {
  wait 29.5;


  switchOnWoofer("blue", 1);
  wait 0.16;
  switchOnWoofer("purple", 1);
  switchOnWoofer("blue", 2);
  wait 0.16;
  switchOnWoofer("purple", 2);
  switchOnWoofer("blue", 3);

  wait 0.16;
  switchOnWoofer("purple", 3);
  switchOnWoofer("blue", 4);
  wait 0.16;
  switchOnWoofer("purple", 4);
  switchOnWoofer("blue", 5);
  wait 0.16;
  switchOnWoofer("purple", 5);
  switchOnWoofer("blue", 6);
  wait 0.3;
  switchOnWoofer("purple", 6);
}

doDreamerNeons() {
  level endon("music_stopped");
  origins_x = [];
  origins_y = [];
  for(i=0; i<6; i++) {
    x = getent("pit_bottom_x_"+i, "targetname");
    y = getent("pit_bottom_y_"+i, "targetname");
    origins_x[i] = x;
    origins_y[i] = y;
  }
  origin_orientations[0][0] = origins_x;
  origin_orientations[0][1] = "vert";
  origin_orientations[1][0] = origins_y;
  origin_orientations[1][1] = "horiz";

  colors = strTok("blue|yellow|purple", "|");

  wait 29.55;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));

  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 30.24;
  color = pickElement(colors);
  thread _doDreamerNeons(origin_orientations[0], color);
  thread _doDreamerNeons(origin_orientations[1], color, 0, 6 * 0.16);

  wait 10.24;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));

  wait 30.24;
  color = pickElement(colors);
  thread _doDreamerNeons(origin_orientations[0], color);
  thread _doDreamerNeons(origin_orientations[1], color, 0, 6 * 0.16);

  wait 10.24;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 10.11;

  thread _doDreamerNeons(origin_orientations[0], pickElement(colors));
  thread _doDreamerNeons(origin_orientations[0], pickElement(colors), 0, 2*0.16);
  thread _doDreamerNeons(origin_orientations[1], pickElement(colors), 0, 3*0.16);
  thread _doDreamerNeons(origin_orientations[0], pickElement(colors), 0, 4*0.16);
  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
  wait 10.11;
  thread _doDreamerNeons(pickElement(origin_orientations), pickElement(colors));
}

_doDreamerNeons(origin_orientation, color, wait_between, wait_before) {
  // Displays neon effect of a specific color at origins in vertical or horizontal orientation
  level endon("music_stopped");
  if(!isdefined(wait_between))
    wait_between = 0.16;
  if(!isdefined(wait_before))
    wait_before = 0;
  
  origins = origin_orientation[0];
  orientation = origin_orientation[1];
  effect_name = "party_"+color+"_neon_"+orientation;
  
  wait wait_before;  
  for(i=0; i<origins.size; i++) {
    playFX(level._effect[effect_name], origins[i].origin);
    wait wait_between;
  }
}

pickElement(arr) {
  // Randomly picks 1 element from array
  if(arr.size < 2)
    index = 0;
  else
    index = randomIntRange(0, arr.size);
  return arr[index];
}
