extends KinematicBody2D

const moveSpeed = 100
const maxSpeed = 150

const jumpHeigh = -300
const up = Vector2(0,-1)
const gravity = 15

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

var motion = Vector2()

func _physics_process(delta):
	
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		animationPlayer.play("Run")
		motion.x = min(motion.x + moveSpeed,maxSpeed)
		
	elif Input.is_action_pressed("ui_left"):
		animationPlayer.play("Run")
		motion.x = max(motion.x - moveSpeed,-maxSpeed)
		
	else:
		animationPlayer.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			motion.y = jumpHeigh
		if friction == true:
			motion.x = lerp(motion.x ,0,0.5)
	else:
		if friction==true:
			motion.x = lerp(motion.x,0,0.01)
			
	motion = move_and_slide(motion,up)





func add_Coin():
	
	var canvasLayer = get_tree().get_root().find_node("CanvasLayer",true,false);
	
	canvasLayer.handleCoinCollected()
	







func _on_Spikes_body_entered(body):
	if body.get_name() == "Player":
		print("Has Muerto")
		get_tree().reload_current_scene()

