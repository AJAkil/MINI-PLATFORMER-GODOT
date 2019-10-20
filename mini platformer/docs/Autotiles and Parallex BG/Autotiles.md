# Autotiles in GODOT

* Create a new scene for the dirt auto tile scene, reimport it by setting the preset and also de-center it and set the transform offset to (0,0)
* Convert this to a usable tile set so that it can be used in the actual world
* Then adda tilemap to the world and set the autotile mode on by clicking the texture and setting the autotile.
* Set the **Autotile Bitmask Mode** to **3x3** so that you can select the autotiles betterly
* Select the places of the autotile you want to fill up. We fill up the autotiles, still there is no collision in the autotiles.
* So we go to the autotiles and select collisiona nd select the polygon shaped thing and set the map shaped thing on so that we can have snap turned on. Then we start setting the borders up for the collisions. Once the collision has been set up the region becomes yellow! We keep on doing this, till the collision setting is done for all the autotiles.
*  This sets the autotiles for us to collide in the game. We can change the game's main scene as **project->project settings->Application->Run->main scene**.
* 