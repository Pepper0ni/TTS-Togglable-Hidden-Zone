zonePosition={0,12.5,40}--spawn position of the hidden zone, relative to this object
zoneRotation={0,0,0}--rotation of the hidden zone
zoneScale={80,52,80}--size of the hidden zone

function onLoad()
 local selfScale=self.getScale()
 local params={
 function_owner=self,
 label='Toggle Hidden Zone',
 tooltip="Turns a hidden zone on or off. The hidden zone will belong to the player who presses the button.",
 font_size=180,
 width=1600,
 height=220,
 scale={1/selfScale.x,1/selfScale.y,1/selfScale.z},
 position={0,-1/selfScale.y,1/selfScale.z},
 click_function='ToggleHidden'
 }
 self.createButton(params)
end

function ToggleHidden(obj,color,alt)
 if zone then
  zone.Destroy()
  zone=nil
  self.setColorTint({0.5,0.5,0.5})
 else
  zone=spawnObject({type="FogOfWarTrigger",position=self.PositionToWorld(zonePosition),rotation=zoneRotation,scale=zoneScale})
  zone.setValue(color)
  self.setColorTint(Color.fromString(color))
 end
end
