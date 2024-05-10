extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health = 12

func _ready():
	pass


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if global_position.y > 900:
		take_damage()
		velocity.y = -1200
		print("took damage")
		print(health)
	if health <= 0:
		print("death")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func take_damage():
	var health_bar = $"HUD/Health Bar/GreenHealthBar"
	health -= 1
	var health_percentage = health / 12.0
	health_bar.size.x = health_percentage * 319
	
	


	
	
	
