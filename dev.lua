c.naughty.notify({text="ehlooi"})
p = c.awful.layout.parameters(mouse.screen.selected_tag)
c.naughty.notify({text=tostring(p)})
c.naughty.notify({text=tostring(p.geometries)})
