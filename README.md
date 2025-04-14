# godot-steering-behaviors
Implementing steering behaviors in Godot


## Controls

Click anywhere in the game window to set a target position for the agent to move towards.


## Behaviors

`KinematicSeek(agent, max_speed)` 

Align and move towards the target position at a constant velocity

`KinematicArrive(agent, max_speed, radius)`

Align and move towards the target position, slowing down upon approach within a given radius
