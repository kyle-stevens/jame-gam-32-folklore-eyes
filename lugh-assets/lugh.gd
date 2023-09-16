extends CharacterBody2D

# MOVEMENT
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var is_crouching : bool = false
@onready var collision_body : CollisionShape2D = self.get_node("lugh-collision")

# WEAPONS
var has_spear : bool = false
var has_sword : bool = false
var has_sling : bool = false
var has_hound : bool = false
var has_horse : bool = false

# MOUSE RETICLE
var mouse_pos : Vector2 = Vector2.ZERO
@onready var mouse_reticle : Sprite2D = self.get_node("mouse-reticle")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _movement_process(delta):
	# Crouching 
	if is_crouching:
		collision_body.shape = load("res://lugh-assets/crouching_collision.tres")
	else:
		collision_body.shape = load("res://lugh-assets/standing_collision.tres")
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
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

func _mouse_process(delta):
	mouse_pos = get_global_mouse_position()
	mouse_reticle.global_position = mouse_pos

func _sword_attack():
	if not has_sword:
		return

func _spear_attack():
	if not has_spear:
		return

func _sling_attack():
	if not has_sling:
		return

func _horse_dash():
	if not has_horse:
		return

func _hound_dash():
	if not has_hound:
		return

func _inputs_process(delta):
	pass

func _process(delta):
	_movement_process(delta)
	_mouse_process(delta)
	_inputs_process(delta)
