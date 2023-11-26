$fn=96;
$center=true;

base_width=47.6;
base_depth=38.3;
base_height=6.1;

base_cutout_width=13.6;

guide_width=7.5;
guide_depth=10.4;
guide_space=14;
guide_height=24.3-base_height;
guide_cutout_width=guide_width-7.3;
guide_slot_depth=5.5;
guide_slot_width=3;
guide_slot_y=6.8;
guide_bottom_cutout_width=6.3;
guide_botton_cutout_depth=3.9;

guide_x=base_depth/2-guide_depth;
guide_y=base_depth/2-7.4;
guide_z=0;

slide_width=33.3;
slide_depth=13.1;
slide_height=18.5-base_height;
slide_cutout=6;
slide_wall=1.8;
slide_x=0;
slide_y=15.5;
slide_z=-slide_height;

base_cutout_depth=slide_depth;

screw_rad=2;
screw_head=4;
screw_head_height=2.3;
screw_x=5.9+screw_rad;
screw_y=26.1+screw_rad;

nut_rad=3.4;
nut_height=2.2;

bolt_offset=5;

module front()
{
  difference()
  {
    union()
    {
      cube([ base_width, base_depth, base_height ], center = true);

      translate([ 0, -base_depth/2+slide_depth, slide_z/2 ])
        cube([ slide_width, slide_depth, slide_height ], center = true);
        
      //The fingers
      translate([ -guide_space/2-guide_width/2, -base_depth/2+guide_depth/2, guide_height/2+base_height/2 ]) 
        cube([ guide_width, guide_depth, guide_height ], center = true);

      translate([ guide_space/2+guide_width/2, -base_depth/2+guide_depth/2, guide_height/2+base_height/2 ]) 
        cube([ guide_width, guide_depth, guide_height ], center = true);
    }
    
  
    //bottom cutout
    translate([ 0, -base_depth/2+base_cutout_depth/2, base_height/2]) 
      cube([ guide_space, base_cutout_depth, base_height+slide_height+guide_height ], center = true);

    //slide cutout
    translate([ 0, -base_depth/2-slide_cutout/2+slide_y, base_height ])
      cube([ slide_width-slide_wall*2, slide_cutout, slide_height+base_height*2+guide_height ], center = true);
  
    translate([ 0, -base_depth/2+slide_depth/2, -base_height/2-slide_height/2 ])
      cube([ slide_width-slide_wall*2, slide_depth, slide_height ], center = true);

    //guide cutouts
    translate([ -guide_space/2-guide_slot_depth/2, -base_depth/2-guide_slot_width/2+guide_slot_y, guide_height/2]) 
      #cube([ guide_slot_depth, guide_slot_width, guide_height+base_height ], center = true);

    translate([ guide_space/2+guide_slot_depth/2, -base_depth/2-guide_slot_width/2+guide_slot_y, guide_height/2 ]) 
      #cube([ guide_slot_depth, guide_slot_width, guide_height+base_height ], center = true);
      
          translate([ -guide_space/2-guide_width/2-.6, -base_depth/2+(guide_depth-7)/2, guide_height/2+base_height/2 ]) 
      #cube([ guide_width-1.2, guide_depth-7, guide_height ], center = true);

    translate([ guide_space/2+guide_width/2+.6, -base_depth/2+(guide_depth-7)/2, guide_height/2+base_height/2 ]) 
      #cube([ guide_width-1.2, guide_depth-7, guide_height ], center = true);
      
      

    //Mount holes
    translate([ -base_width/2+screw_x, -base_depth/2+screw_y, 0 ])
    {
      cylinder( h=base_height, r=screw_rad, center = true);
      translate([ 0, 0, -base_height/2+screw_head_height/2 ])
      cylinder( h=screw_head_height, r=screw_head, center = true);
    }

    translate([ base_width/2-screw_x, -base_depth/2+screw_y, 0 ])
    {
      cylinder( h=base_height, r=screw_rad, center = true);
      translate([ 0, 0, -base_height/2+screw_head_height/2 ])
      cylinder( h=base_height, r=screw_head, center = true);
    }

    translate([ 0, -base_depth/2+screw_y, 0 ])
      cylinder( h=base_height, r=screw_rad, center = true);
      
      translate([ -base_width/2+14.1, -base_depth/2+screw_y, base_height/2-3.4/2 ])
      cube([ 4.0, 6.6, 3.4 ], center = true);

    translate([ base_width/2-14.1, -base_depth/2+screw_y, base_height/2-3.4/2 ])
      cube([ 4.0, 6.6, 3.4 ], center = true);

    //Camfer the corners
    translate ([ -base_width/2+5, -base_depth/2+5, 0 ])
    rotate([ 0, 0, 180 ])
    rotate_extrude( angle = 90, $fn = 96 )
    translate([ 8, 0 ]) //curve and z height      
      square([ 6, base_height], center = true );

    translate ([ base_width/2-5, base_depth/2-5, -base_height  ])
    rotate([ 0, 0, 0 ])
    rotate_extrude( angle = 90, $fn = 96 )
    translate([ 8, base_height ]) //curve and z height      
      square([ 6, base_height], center = true );

    translate ([ base_width/2-5, -base_depth/2+5, -base_height ])
    rotate([ 0, 0, 270 ])
    rotate_extrude( angle = 90, $fn = 96 )
    translate([ 8, base_height ]) //curve and z height      
      square([ 6, base_height], center = true );

    translate ([ -base_width/2+5, base_depth/2-bolt_offset, -base_height  ])
    rotate([ 0, 0, 90 ])
    rotate_extrude( angle = 90, $fn = 96 )
    translate([ 8, base_height ]) //curve and z height      
      square([ 6, base_height], center = true );
  }
}

module back()
{
  difference()
  {
    union()
    {
      //The base
      cube([ base_width, base_depth, base_height ], center = true);

      //The fingers
      translate([ -guide_space/2-guide_width/2, -base_depth/2+guide_depth/2, guide_height/2+base_height/2 ]) 
        cube([ guide_width, guide_depth, guide_height ], center = true);

      translate([ guide_space/2+guide_width/2, -base_depth/2+guide_depth/2, guide_height/2+base_height/2 ]) 
        cube([ guide_width, guide_depth, guide_height ], center = true);
    }
    
    //Screw holes
    translate([ base_width/2-bolt_offset, base_depth/2-bolt_offset, base_height/2-2.15/2 ])
    {
      cylinder( h = nut_height, r = nut_rad, center = true, $fn = 6 );
      cylinder( h = base_height*2, r = screw_rad, center = true );
    }

    translate([ -base_width/2+bolt_offset, base_depth/2-bolt_offset, base_height/2-2.15/2 ])
    {
      cylinder( h = nut_height, r = nut_rad, center = true, $fn = 6 );
      cylinder( h = base_height*2, r = screw_rad, center = true );

    }
    
    translate([ base_width/2-bolt_offset, -base_depth/2+bolt_offset, base_height/2-2.15/2 ])
    {
      cylinder( h = nut_height, r = nut_rad, center = true, $fn = 6 );
      cylinder( h = base_height*2, r = screw_rad, center = true );
    }
    
    translate([ -base_width/2+bolt_offset, -base_depth/2+bolt_offset, base_height/2-2.15/2 ])
    {
      cylinder( h = nut_height, r = nut_rad, center = true, $fn = 6 );
      cylinder( h = base_height*2, r = screw_rad, center = true );
    }
  
    //Bottom cutouts
    translate([ 0, -base_depth/2+base_cutout_depth/2, base_height*2]) 
      cube([ guide_space, base_cutout_depth, base_height+slide_height+guide_height ], center = true);

    translate([ 0, -base_depth/2-slide_cutout/2+slide_y, base_height ])
      cube([ slide_width-slide_wall*2, slide_cutout, slide_height+base_height+guide_height ], center = true);
  
    //translate([ 0, -slide_depth, -base_height/2-slide_height/2 ])
      //cube([ slide_width-slide_wall*2, slide_depth/2, slide_height ], center = true);

    //Finger cutouts
    translate([ -guide_space/2-guide_slot_depth/2, -guide_y, guide_height/2]) 
      cube([ guide_slot_depth, guide_slot_width, guide_height+base_height ], center = true);

    translate([ guide_space/2+guide_slot_depth/2, -base_depth/2-guide_slot_width/2+guide_slot_y, guide_height/2 ]) 
      cube([ guide_slot_depth, guide_slot_width, guide_height+base_height ], center = true);

    translate([ -guide_space/2-guide_width/2-.6, -base_depth/2+(guide_depth-5.9)/2, guide_height/2+base_height/2 ]) 
      #cube([ guide_width-1.2, guide_depth-5.9, guide_height ], center = true);

    translate([ guide_space/2+guide_width/2+.6, -base_depth/2+(guide_depth-5.9)/2, guide_height/2+base_height/2 ]) 
      cube([ guide_width-1.2, guide_depth-5.9, guide_height ], center = true);

    //Mount holes
    translate([ -base_width/2+screw_x, -base_depth/2+screw_y, 0 ])
      cylinder( h=base_height, r=screw_rad, center = true);

    translate([ base_width/2-screw_x, -base_depth/2+screw_y, 0 ])
      cylinder( h=base_height, r=screw_rad, center = true);

    translate([ 0, -base_depth/2+screw_y, 0 ])
      cylinder( h=base_height, r=screw_rad, center = true);

    translate([ -base_width/2+14.1, -base_depth/2+screw_y, base_height/2-3.4/2 ])
      cube([ 4.0, 6.6, 3.4 ], center = true);

    translate([ base_width/2-14.1, -base_depth/2+screw_y, base_height/2-3.4/2 ])
      cube([ 4.0, 6.6, 3.4 ], center = true);

    //Corner Camfer
    translate ([ -base_width/2+5, -base_depth/2+5, 0 ])
    rotate([ 0, 0, 180 ])
    rotate_extrude( angle = 90, $fn = 96 )
    translate([ 8, 0 ]) //curve and z height      
      square([ 6, base_height], center = true );

    translate ([ base_width/2-5, base_depth/2-5, -base_height  ])
    rotate([ 0, 0, 0 ])
    rotate_extrude( angle = 90, $fn = 96 )
    translate([ 8, base_height ]) //curve and z height      
      square([ 6, base_height], center = true );

    translate ([ base_width/2-5, -base_depth/2+5, -base_height ])
    rotate([ 0, 0, 270 ])
    rotate_extrude( angle = 90, $fn = 96 )
    translate([ 8, base_height ]) //curve and z height      
      square([ 6, base_height], center = true );

    translate ([ -base_width/2+5, base_depth/2-bolt_offset, -base_height  ])
    rotate([ 0, 0, 90 ])
    rotate_extrude( angle = 90, $fn = 96 )
    translate([ 8, base_height ]) //curve and z height      
      square([ 6, base_height], center = true );
  }
}

front();
//translate([ 0, 0, base_height/2 ])
//back();