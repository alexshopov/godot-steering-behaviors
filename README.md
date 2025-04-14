# godot-steering-behaviors
Implementing steering behaviors in Godot based on [AI for Games, Third Edition](https://www.goodreads.com/book/show/41755104-ai-for-games-third-edition)  by Ian Millington

![Screenshot 2025-04-13 230352](https://github.com/user-attachments/assets/4e6a6d67-fd4e-4fd6-b0b6-e704f6083c40)

This initial demo contains two autonomous agents. The green agent is wandering about the scene, while the red agents seeks the green agent.
## Behaviors

`KinematicSeek(agent, max_speed)` 

Align and move towards the target position at a constant velocity

`KinematicArrive(agent, max_speed, radius)`

Align and move towards the target position, slowing down upon approach within a given radius

`KinematicWander(agent, max_speed, max_rotation)`

Move in the direction of the agent's current orientation. Orientation is randomly modified resulting in meandering movement
