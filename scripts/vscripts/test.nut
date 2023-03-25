

// return;





function log(msg) {
  print(msg);

  local vec = self.GetVelocity();
  self.SetVelocity(vec+Vector(0,0,0));

  local y = self.GetAngles().y;
  if(y > 180)  y = y-360;
  self.SetAngles(0, y, 0);
}

// print(Entities);
// return;

// 玩家随机增加一个任意方向的速度
function random_vector() {
  local max = 2000, min = -2000;
  self.SetVelocity(
    Vector
    ( RandomFloat(min, max)
    , RandomFloat(min, max)
    , RandomFloat(0.00, max - 1000)
    )
  );
}

// 玩家当前速度 x5
function forward_vector() {
  local speed_scale = 5;
  local v = self.GetVelocity( );
  self.SetVelocity( Vector( v.x*speed_scale, v.y*speed_scale, abs(v.z) * 2 ) );  // z轴没有变形 , 因为可能加速下坠
}

// Called after the entity is spawned
function Precache() { self.PrecacheScriptSound( EXPLOSION_SOUND ) }

// Every 0.1 seconds this function checks for decoy_projectiles in the map
// When found, it checks if the decoy is standing still
// If true create an env_explosion, trigger it and kill the decoy

function Think()
{
  local decoy = null
  while( ( decoy = Entities.FindByClassname( decoy, "decoy_projectile" ) ) != null )
  {
    if( decoy.GetVelocity().Length() == 0 )
    {
      local owner = decoy.GetOwner()
      local origin = decoy.GetOrigin()

      local explosion = Entities.CreateByClassname( "env_explosion" )
      explosion.__KeyValueFromInt( "iMagnitude", 1000 )
      explosion.SetOrigin( origin )
      explosion.SetOwner( owner )

      EntFireByHandle( explosion, "Explode", "", 0.1, owner, owner )
      DispatchParticleEffect( "explosion_c4_500", origin, origin )

      decoy.EmitSound( EXPLOSION_SOUND )
      decoy.Destroy()
    }
  }
}

function rand_forw() {
  if (RandomFloat(-1, 1) > 0) {
    random_vector();
  } else {
    forward_vector();
  }
}


// ScriptPrintMessageCenterAll("木大木大木打 ~");

function shanxian() {
  local len = 200;
  local pos = self.GetOrigin();
  local new_v = Vector(30,60,-89) + Vector(30,0,0);
  print(new_v);
  print(ang);
  print("\n");
  // self.SetOrigin(pos + Vector(0,0,300));
  self.SetAngles(ang.x, ang.y, 50);
}

function max(a,b){return a>b?a:b;}
function min(a,b) {return a>b?b:a;}

function getPlayer() {
  local ent = null;
  if ( ( ent = Entities.FindByClassname(ent, "player") ) != null || ( ent = Entities.FindByClassname(ent, "player") ) != null ) {
    return ent;
  }
}

//  shanxian();
//  Think();
//  random_vector();
//  forward_vector();
//  rand_forw();
//  self.SetHealth(999);
