// self.EyePosition() self.GetAngles() +" # "+

// printl(self.GetForwardVector() + " # " + self.GetLeftVector() +"#"+ self.GetUpVector())
return;
print("                                   ")
local v = self.GetVelocity();
local y = self.GetAngles().y;
if(y > 180)  y = y-360;

//print(v, v.Norm())
print(self.GetAngles() + "## " + y + "###")
printl("")

// bind mwheelup "ent_fire !self runscriptfile code"; bind q "setang 0 0 0; setpos 0 0 64"; bind e "ent_fire !self runscriptfile test"; con_filter_text "";



