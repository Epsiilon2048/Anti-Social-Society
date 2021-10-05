function colliding_at_pixel(x, y){

if 0 > x or x > room_width or 0 > y or y > room_height or tilemap_get_at_pixel(tile_collision, x, y) return true

if instance_position(x, y, o_collision) return true

var inst = instance_position(x, y, o_monster)
if instance_exists(inst) and inst.collision return true

return false
}