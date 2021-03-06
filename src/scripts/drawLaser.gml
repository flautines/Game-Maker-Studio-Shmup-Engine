///This script draws the Gradius Laser from objCamera's Draw event
draw_enable_alphablend(false);

if instance_exists(objLaser)
{
    var i;
    for (i = 0; i < instance_number(objLaser); i += 1)
    {
        thisLaser = instance_find(objLaser,i);
        with (thisLaser)
        {
            if laserType == 1 //Standard laser
            {
                draw_sprite_ext(sprLaser,2,x,y,image_xscale, image_yscale,0,c_white,1);
            }
            else if laserType == 3 //C. Laser
            {
                for (var j=0; j<=length-1; j++)
                {
                    var cycLas = cycImgIndex;
                    if (j%2==0)
                    {
                        cycLas = !cycLas;
                    }
                    
                    draw_sprite(sprLaser,cycLas,x+(j*4),y);
                }
            }
            else if laserType == 4 //Twin Laser
            {
                draw_enable_alphablend(true);
                draw_sprite(sprTwinLaser,0,x,y);
            }
            else if laserType == 2 //Ripple Laser
            {
                draw_enable_alphablend(true);
                draw_sprite_ext(sprRippleLaser,0,x,y,image_xscale,image_yscale,0,c_white,1);
            }
        }
    }
}

draw_enable_alphablend(true);
