main()
{
  if(!isDefined(level._effect))
    level._effect = [];

  level._effect["particles_orange"] = loadfx("fx/cly/cly_temple_particles_orange.efx");
  level._effect["fire"] = loadfx ("fx/cly/cly_ground_fire_small_oneshot.efx");
  level._effect["fire_torch"] = loadfx("fx/cly/cly_fire_torch.efx");
  level._effect["flying_shit1"] = loadfx("fx/cly/cly_flying_shit1.efx");
  level._effect["flying_shit_ending"] = loadfx ("fx/cly/cly_flying_shit_ending.efx");  // Uses: cly_flying_shit_death
  level._effect["ascend"] = loadfx ("fx/cly/cly_ascend.efx");
  level._effect["ascend_particles"] = loadfx("fx/cly/cly_ascend_particles.efx");

  level._effect["neon_light"] = loadfx ("fx/cly/cly_neon_light.efx");  // Uses: cly_blue_neon2, cly_purple_neon2

  level._effect["small_light_blue"] = loadfx ("fx/cly/cly_small_light_blue.efx");
  level._effect["small_light_orange"] = loadfx ("fx/cly/cly_small_light_orange.efx");
  level._effect["small_light_purple"] = loadfx ("fx/cly/cly_small_light_purple.efx");
  level._effect["small_light_yellow"] = loadfx ("fx/cly/cly_small_light_yellow.efx");


  level._effect["particle_descend_stream"] = loadfx ("fx/cly/cly_descend_particle_stream.efx");
  level._effect["particle_yellow"] = loadfx ("fx/cly/cly_particles_yellow.efx");

  level._effect["descend_gate"] = loadfx ("fx/cly/cly_descend_gate.efx");

  //Finish
  level._effect["fireflies"] = loadfx ("fx/cly/cly_fireflies.efx");
  level._effect["potato"] = loadfx ("fx/cly/cly_potato_particles3.efx");

  // PARTY - DREAMER
  level._effect["ball_purple"] = loadfx ("fx/cly/cly_party_ball_purple.efx");
  level._effect["ball_yellow"] = loadfx ("fx/cly/cly_party_ball_yellow.efx");
  level._effect["ball_blue"] = loadfx ("fx/cly/cly_party_ball_blue.efx");
  level._effect["ball_shot"] = loadfx ("fx/cly/cly_party_ball_shot.efx");
  level._effect["needles"] = loadfx ("fx/cly/cly_party_needles.efx");
  level._effect["party_blue_neon_vert"] = loadfx ("fx/cly/cly_party_blue_neon_vertical.efx");
  level._effect["party_blue_neon_horiz"] = loadfx ("fx/cly/cly_party_blue_neon_horizontal.efx");
  level._effect["party_yellow_neon_vert"] = loadfx ("fx/cly/cly_party_yellow_neon_vertical.efx");
  level._effect["party_yellow_neon_horiz"] = loadfx ("fx/cly/cly_party_yellow_neon_horizontal.efx");
  level._effect["party_purple_neon_vert"] = loadfx ("fx/cly/cly_party_purple_neon_vertical.efx");
  level._effect["party_purple_neon_horiz"] = loadfx ("fx/cly/cly_party_purple_neon_horizontal.efx");
  level._effect["party_dreamer_smoke"] = loadfx ("fx/cly/cly_party_dreamer_smoke.efx");

  // PARTY - RAINBOW
  level._effect["party_blue_neon_vert_fadein"] = loadfx ("fx/cly/cly_party_blue_neon_vertical_fadein.efx");
  level._effect["party_blue_neon_horiz_fadein"] = loadfx ("fx/cly/cly_party_blue_neon_horizontal_fadein.efx");
  level._effect["party_blue_ball"] = loadfx ("fx/cly/cly_party_blue_ball.efx");
  level._effect["party_rainbow_particles_3"] = loadfx ("fx/cly/cly_party_rainbow_particles_3.efx");
  level._effect["party_rainbow_particles_3_bottom"] = loadfx ("fx/cly/cly_party_rainbow_particles_3_bottom.efx");
  level._effect["party_rainbow_particles_4"] = loadfx ("fx/cly/cly_party_rainbow_particles_4.efx");
  level._effect["party_rainbow_particles_5"] = loadfx ("fx/cly/cly_party_rainbow_particles_5.efx");
  level._effect["party_rainbow_particles_6_sphere"] = loadfx ("fx/cly/cly_party_rainbow_particles_6_sphere.efx");
  level._effect["party_rainbow_particles_6_particles"] = loadfx ("fx/cly/cly_party_rainbow_particles_6_particles.efx");
  level._effect["party_rainbow_particles_7"] = loadfx ("fx/cly/cly_party_rainbow_particles_7.efx");
  level._effect["party_rainbow_particles_8"] = loadfx ("fx/cly/cly_party_rainbow_particles_8.efx");
  level._effect["party_rainbow_particles_9"] = loadfx ("fx/cly/cly_party_rainbow_particles_9.efx");  // uses: "fx/cly/cly_party_rainbow_particles_9b,c,d,e.efx"
  level._effect["party_rainbow_particles_10"] = loadfx ("fx/cly/cly_party_rainbow_particles_10.efx");
  level._effect["party_rainbow_particles_11"] = loadfx ("fx/cly/cly_party_rainbow_particles_11.efx");

  // PARTY - CHERI
  level._effect["party_cheri_sides1"] = loadfx ("fx/cly/cly_party_cheri_sides1.efx");
  level._effect["party_cheri_sides1b"] = loadfx ("fx/cly/cly_party_cheri_sides1b.efx");
  level._effect["party_cheri_sides1c"] = loadfx ("fx/cly/cly_party_cheri_sides1c.efx");
  level._effect["party_cheri_sides2"] = loadfx ("fx/cly/cly_party_cheri_sides2.efx");
  level._effect["party_cheri_sides3"] = loadfx ("fx/cly/cly_party_cheri_sides3.efx");
  level._effect["party_cheri_sides3b"] = loadfx ("fx/cly/cly_party_cheri_sides3b.efx");
  level._effect["party_cheri_sides_small"] = loadfx ("fx/cly/cly_party_cheri_sides_small.efx");
  level._effect["party_cheri_floor2b"] = loadfx ("fx/cly/cly_party_cheri_floor2b.efx");
  level._effect["party_cheri_floor4"] = loadfx ("fx/cly/cly_party_cheri_floor4.efx");
  level._effect["party_cheri_floor5"] = loadfx ("fx/cly/cly_party_cheri_floor5.efx");   // uses: "fx/cly/cly_party_cheri_floor5c.efx"
  level._effect["party_cheri_smoke"] = loadfx ("fx/cly/cly_party_cheri_smoke.efx");
  level._effect["party_cheri_snow"] = loadfx ("fx/cly/cly_party_cheri_snow.efx");

  // PARTY - SABATON
  level._effect["party_sabaton_fire_small"] =  loadfx ("fx/cly/cly_party_sabaton_3_runner.efx");
  level._effect["party_sabaton_fire_small_ring"] =  loadfx ("fx/cly/cly_party_sabaton_3_runner_small_ring.efx");
  level._effect["party_sabaton_fire_all_ground"] =  loadfx ("fx/cly/cly_party_sabaton_3_all_ground_runner.efx");
  level._effect["party_sabaton_fire_big"] =  loadfx ("fx/cly/cly_party_sabaton_3_big_single_runner.efx");  //uses: cly_party_sabaton_3_big
  level._effect["party_sabaton_fire_big_ring"] =  loadfx ("fx/cly/cly_party_sabaton_3_big_ring_runner.efx");  //uses: cly_party_sabaton_3_big
  level._effect["party_sabaton_smoke"] =  loadfx ("fx/cly/cly_party_sabaton_smoke4.efx");

  // Quotes
  level._effect["quote_poof"] =  loadfx ("fx/cly/cly_quote_poof3.efx");

  initParticlesOrange();
  initLights();
  initFires();
  initParticleStreams();
  initParticleYellow();
  initDescendGate();
  initFireflies();
  initFlyingShit();
  
  thread initFxAscend();
}

initFireflies()  {
  ents = getentarray("fx_fireflies", "targetname");
  for(i = 0; i < ents.size; i++)
    playLoopedFx(level._effect["fireflies"], 1.5, ents[i].origin);
}

initDescendGate() {
  ents = getentarray("fx_descend_gate", "targetname");
  for(i = 0; i < ents.size; i++)
  {
    playLoopedFx(level._effect["descend_gate"], 0.7, ents[i].origin, 0, anglesToForward(ents[i].angles), anglesToUp(ents[i].angles));
  }
}

initParticleYellow() {
  ring = getentarray("fx_particle_ring", "targetname");
  for(i = 0; i < ring.size; i++)
  {
    playLoopedFx(level._effect["particle_yellow"], 0.3, ring[i].origin);
  }
}

initParticleStreams() {
  core = getentarray("fx_particle_stream_core", "targetname");
  for(i=0; i<core.size; i++)
    playLoopedFx(level._effect["particle_descend_stream"], 1.5, core[i].origin);
}

initParticlesOrange() {
  orig = getentarray("fx_particles_orange", "targetname");
  for(i = 0; i < orig.size; i++)
    playLoopedFx(level._effect["particles_orange"], 1, orig[i].origin);
}

initLights() {
  small_lights_blue = getentarray("fx_small_light_blue", "targetname");
  small_lights_orange = getentarray("fx_small_light_orange", "targetname");
  small_lights_purple = getentarray("fx_small_light_purple", "targetname");
  small_lights_yellow = getentarray("fx_small_light_yellow", "targetname"); 
  blue_neons = getentarray("fx_neon_light", "targetname");
  
  for(i = 0; i < small_lights_blue.size; i++)
    playLoopedFx(level._effect["small_light_blue"], 0.7, small_lights_blue[i].origin);

  for(i = 0; i < small_lights_orange.size; i++)
    playLoopedFx(level._effect["small_light_orange"], 0.7, small_lights_orange[i].origin);

  for(i = 0; i < small_lights_purple.size; i++)
    playLoopedFx(level._effect["small_light_purple"], 0.7, small_lights_purple[i].origin);

  for(i = 0; i < small_lights_yellow.size; i++)
    playLoopedFx(level._effect["small_light_yellow"], 0.7, small_lights_yellow[i].origin);

  for(i = 0; i < blue_neons.size; i++)	
    playLoopedFx(level._effect["neon_light"], 1.5, blue_neons[i].origin, 0, anglesToForward(blue_neons[i].angles));
}

initFires() {	
  fires = getentarray("fire", "targetname");
  torches = getentarray("wall_torch_fire_origin", "targetname");
  for(i=0;i<fires.size;i++)
    fires[i] thread lightFire("fire");

  for(i = 0; i < torches.size; i++)
    torches[i] thread lightFire("fire_torch");
}

lightFire(fire_name) {
  playLoopedFx(level._effect[fire_name], 0.7, self.origin);
  self playloopsound("fire");
}

initFlyingShit() {
  // P4 objects flying up
  flying_shit1 = getent("flying_shit1", "targetname");
  flying_shit_ending = getent("flying_shit_ending", "targetname");

  playLoopedFx(level._effect["flying_shit_ending"], 5, flying_shit_ending.origin);
  playLoopedFx(level._effect["flying_shit1"], 7, flying_shit1.origin);
}

initFxAscend() {
  particles_orig = getent("fx_ascend_particles", "targetname");
  playLoopedFx(level._effect["ascend_particles"], 0.6, particles_orig.origin);
  
  trig = getent("fx_ascend", "targetname");
  while(1) {
    trig waittill("trigger", player);
    PlayFX(level._effect["ascend"], player.origin);
    wait 5;
  }
}