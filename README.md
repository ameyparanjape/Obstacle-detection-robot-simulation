# Obstacle detection robot simulation in MATLAB 

-	We will be designing a simple robot simulator as shown in the image below. 
-	The goal of the simulator is for the magenta robot to reach the green destination while avoiding the blue walls (the checkered walls only server a visual purpose).
-	We first must draw an arena of 11x11 size. Each ‘square’ is a pixel.
-	This drawing includes- The checkerboard pattern, Blue walls, Green destination point, Magenta robot
-	We then must ask the user to input a direction and move the robot one space in that direction.
-	The possible direction are north(up), south(down), east(right), west(left).
-	After receiving the input, shift the position of the magenta robot correspondingly. (Make sure the checkboard pattern is maintained!)
-	If a movement would cause the robot to occupy the same square as a wall, then ignore that movement.
-	Continue asking the user for input until the robot reaches the destination.

