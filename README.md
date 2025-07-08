# godot-steering-behaviors
Learning Godot by implementing steering behaviors based on [AI for Games, Third Edition](https://www.goodreads.com/book/show/41755104-ai-for-games-third-edition)  by Ian Millington

### *Archived. If you're not embarrassed by code you wrote 3 months ago, you're not growing as a dev. This was a useful project at the time, but I've learned much better ways to accomplish much of this now.* ###

![Screenshot 2025-04-14 114832](https://github.com/user-attachments/assets/3ea2585b-9c19-4579-9904-2df48c87ec61)


This initial demo contains two autonomous agents. The green agent is wandering about the scene, while the red agent seeks the green agent. The red agent's search area is shown by a circle.


## Behaviors

`KinematicSeek(p_agent: Agent, p_target: Vector2, p_max_speed: float)` 

Align and move towards the target position at a constant velocity

`KinematicArrive(p_agent: Agent, p_target: Vector2, p_max_speed: float, p_radius: float)`

Align and move towards the target position, slowing down upon approach within a given radius

`KinematicWander(p_agent: Agent, p_max_speed: float, p_max_rotation: float)`

Move in the direction of the agent's current orientation. Orientation is randomly modified resulting in meandering movement
