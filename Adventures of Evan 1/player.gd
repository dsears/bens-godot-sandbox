extends CharacterBody2D

@export var speed = 200
@export var gravity = 10
@export var jump_speed = 250

func _ready():
	reset_game()

func reset_game():
	position.x = 80
	position.y = 352
	velocity = Vector2.ZERO

func _physics_process(delta):
	
	# Update x based on movement
	velocity.x = 0
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	
	# Update y for gravity and jump
	velocity.y += gravity
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y -= jump_speed
		
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	if not is_on_floor():
		$AnimatedSprite2D.frame = 1

	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited():
	reset_game()
