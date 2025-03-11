extends CanvasLayer

var coins = 0

func _ready():
	$CoinsCollectedText.text = String(coins)
func handleCoinCollected():
	print("Coin Collected")	
	coins+=1
	$CoinsCollectedText.text = String(coins)
	
	
	
	if coins == 5:
		get_tree().change_scene("res://2. Escenas/Pantalla Victoria.tscn")
		
