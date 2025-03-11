extends Control


func _ready():
	$VBoxContainer/Comenzar.grab_focus()


func _on_Comenzar_pressed():
	get_tree().change_scene("res://2. Escenas/Mundo.tscn")


func _on_Salir_pressed():
	get_tree().quit()
