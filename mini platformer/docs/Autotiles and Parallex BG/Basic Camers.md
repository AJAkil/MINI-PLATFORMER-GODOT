# Setting the camera and background in the game in Godot 

* We go to the character scene and add the camera2D node to the character in Godot and set the **Current** option on.
* We turn off the drag margins as well, thus we have a basic camera set up in the game!
* Then we select the background of the game add it with **parallax background** node and then adding the sky with it, make the center and transform to (0,0) and set the stuffs basically.

## Better Camera Settings

* We turn off smoothing in the player scene and **camera** option.
* Then we go to **project-->project settings-->Rendering-->Quality-->use pixel snap**  
* Add a parallax layer node to the parallax background node and make the sky a children of parallax background.
* Then we go to parallax layer and set the mirroring so that the the background repeats itself again and again. Then we set the scale of the parallax background so that we set at what pace the background will follow the players main camera.
* If we lessen the scale, then my problem actually is solved to a great extent
* 