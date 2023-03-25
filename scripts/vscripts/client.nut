

me <- Entities.FindByClassname(null, "player")
if(me == null)
  print("noo~~")
else
  print(me.GetForwardVector() * 200);
