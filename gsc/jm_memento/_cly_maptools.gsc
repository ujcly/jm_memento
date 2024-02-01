/*
Contains simplified functions implemented in JH mod to make the map playable locally.
*/

addTrigger(trig) {
>>>>>>> 390f347... f
  if(!isdefined(self.trigs))
    self.trigs = [];
  self.trigs[trig] = true;
  if(isdefined(level.trigitems))
  {
    players = getentarray("player", "classname");
    for(i = 0; i < level.trigitems.size; i++)
    {
      if(isdefined(level.trigitems[i].nottrigger) && level.trigitems[i].nottrigger == trig)
      {
        level.trigitems[i] hide();
        for(j = 0; j < players.size; j++)
        {
          if(!players[j] hastrigger(trig))
            level.trigitems[i] showtoplayer(players[j]);
        }
      }
      if(isdefined(level.trigitems[i].trigger) && level.trigitems[i].trigger == trig)
      {
        level.trigitems[i] showtoplayer(self);
      }
    }
  }
}

hasTrigger(trig) {
  if(!isdefined(self.trigs))
    return false;
  if(!isdefined(self.trigs[trig]))
    return false;
  return true;
}

// ambientplay() but per-player. Use sound=undefined for ambientstop() on a per-player basis
setAmbient(sound, time, repeat, force) {
  if(!isdefined(repeat))
    repeat = true;
  if(!isdefined(sound)) {
    // Stops ambient
    self notify("stop_audio");
    self playlocalsound("null2");
    return;
  }
  if(repeat)
    self thread repeatAudio(sound, time);
  else
    self playlocalsound(sound);
}

repeatAudio(sound, time) {
  self endon("stop_audio");
  self endon("disconnect");
  while(true) {
    self playlocalsound(sound);
    wait time;
  }
}

setBusy(busy) {
  if(!isdefined(self.busy))
    self.busy = 0;
  
  if(busy)
    self.busy++;
  else
    self.busy--;
}

isBusy() {
  if(!isdefined(self.busy) || self.busy == 0)
    return false;
  return true;
}

removeTrigger(trig) {
  if(!isdefined(self.trigs) || !isdefined(self.trigs[trig]))
    iprintlnbold("Script warning: Trying to remove trigger " + trig + " while user does not have that trigger");
  else
    self.trigs[trig] = undefined;
  if(isdefined(level.trigitems)) {
    players = getentarray("player", "classname");
    for(i = 0; i < level.trigitems.size; i++) {
      if(isdefined(level.trigitems[i].trigger) && level.trigitems[i].trigger == trig) {
        level.trigitems[i] hide();
        for(j = 0; j < players.size; j++) {
          if(players[j] hastrigger(trig))
            level.trigitems[i] showtoplayer(players[j]);
        }
      }
      if(isdefined(level.trigitems[i].nottrigger) && level.trigitems[i].nottrigger == trig) {
        level.trigitems[i] showtoplayer(self);
      }
    }
  }
}

addSecret(secret) {
  if(!isdefined(self.secrets))
    self.secrets = [];
  self.secrets[secret] = true;
  if(isdefined(level.secretitems)) {
    players = getentarray("player", "classname");
    for(i = 0; i < level.secretitems.size; i++) {
      if(isdefined(level.secretitems[i].notsecret) && level.secretitems[i].notsecret == secret) {
        level.secretitems[i] hide();
        for(j = 0; j < players.size; j++) {
          if(!players[j] hassecret(secret))
            level.secretitems[i] showtoplayer(players[j]);
        }
      }
      if(isdefined(level.secretitems[i].secret) && level.secretitems[i].secret == secret) {
        level.secretitems[i] showtoplayer(self);
      }
    }
  }
}

hasSecret(secret) {
  if(!isdefined(self.secrets))
    return false;
  if(!isdefined(self.secrets[secret]))
    return false;
  return true;
}

notSecretOnly(secret) {
  if(!isdefined(level.secretitems))
    level.secretitems = [];
  for(i = 0; i < level.secretitems.size; i++) {
    if(level.secretitems[i] == self){
      iprintlnbold("Item already registered for notsecretonly " + secret + ". Please dont duplicate");
      return;
    }
  }
  level.secretitems[level.secretitems.size] = self;
  self.notsecret = secret;
}
