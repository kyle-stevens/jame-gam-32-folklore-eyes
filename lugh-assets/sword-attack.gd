extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.look_at(get_global_mouse_position()) # after release we do the dash
	if Input.is_action_just_released("ui_end"):
		print('sunbeam')
		self.queue_free()


func _on_body_entered(body):
	if body is CharacterBody2D or \
	body is StaticBody2D:
		return
	pass
