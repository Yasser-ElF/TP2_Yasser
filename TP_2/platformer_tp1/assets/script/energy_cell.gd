extends Area2D

@onready var collect_sfx: AudioStreamPlayer2D = $collect
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	$AnimatedSprite2D.play("energy_cell")


func _on_body_entered(body):
	if body is PlayerController:
		GameManager.add_energy_cell()
		$collect.play()
		sprite.hide()
		await collect_sfx.finished
		queue_free()
