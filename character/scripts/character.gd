extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 500:
			velocity.y = 500
			
	if Input.is_action_just_pressed("jump") && is_on_floor():
			velocity.y = -jump_force
	
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction
	if horizontal_direction != 0:
		if horizontal_direction < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
		if is_on_floor() == true:
			animated_sprite.play("Run")
		else:
			animated_sprite.play("Jump")
	else:
		animated_sprite.play("Idle")
	move_and_slide()
