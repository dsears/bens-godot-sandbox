extends CharacterBody2D

@export var speed = 1

func _physics_process(delta):

	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider().get_name()
		if collider.begins_with("Grass"):
			print("I collided with grass")
			speed *= -1
	else:
		velocity.x += speed
