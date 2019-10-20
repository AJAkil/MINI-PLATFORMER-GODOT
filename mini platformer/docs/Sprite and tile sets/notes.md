# Setting Tile sets in Godot

- Create a new scene
- Add a new node for the tiles, add the sprite to the Texture
- Go to import and select preset and select 2D pixel or 2D or whatever is suitable for you and then reimport
- Then remove the click from the center
- Go to **region** and enable the region by clicking it, this will remove the region from the screen
- At the bottom go to **Texture region** and then select the **step** to be **32 by 32** 
- Then select a tile from the region, add collision to it.
- For that add **static body** and then add **collision shape 2d** and then  select the **shape** of the collision shape2d as rectangle shape2D and go to **Transform** of **collision** node and set the position accordingly.
- Save the scene and make sure that the visibility of **collision** is not enabled
- Then set the tile map in a certain order by copying and pasting. The reason we set **collision** before this because we want that every tile map we set should have the same property of collision.
- Once that is done, we convert this to an actual tile set. For this we go **Scene -> Convert To -> Tile set** and save the tile set