function colliding_at_pixel(x, y){

return 0 > x or x > room_width or 0 > y or y > room_height or tilemap_get_at_pixel(tile_collision, x, y)
}