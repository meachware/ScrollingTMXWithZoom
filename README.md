#SpriteBuilder ScrollingTMX With Zoom

This is an example of loading a TMX tiled map and reset the zoom. The example is hard coded for 25, 50, 75 and 100 % zoom levels triggered by “-“ and “+” buttons.

I created this because I needed to create something for my game to represent both my galactic (zoomed out) and local (zoomed in) star map.

This could be extended to use “pinch” and “zoom” gestures and still use a preset zoom amount, shhh the user will never know.

I could not achieve my desired functionality by adding the CCScrollView with SpriteBuilder; however, taking a cue from the cocos2d tile map tests, the CCScrollView is removed and re-added programmatically on each zoom reset.

Remember to publish this in SpriteBuilder before running in Xcode :)

**Notes:**

I’ve found it very helpful after working through a tough or challenging problem to create a test case to reinforce the information learned. That would be the rationale for this project :)
