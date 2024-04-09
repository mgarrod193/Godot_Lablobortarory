extends CanvasLayer

signal restart #signal for restarting game


#emits restart signal when button pressed
func _restart_pressed():
	restart.emit()
