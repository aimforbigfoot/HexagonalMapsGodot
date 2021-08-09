tool
extends Spatial


var size := 1
var w := sqrt(3) * size
var h := 2*size - 0.01
var offest := 0.49*w

func _ready() -> void:
	generateHexTest()

func generateHexTest() -> void:
	for x in 6:
		for z in 6:
			var hex :Spatial= preload("res://src/hexagonTile/hexagon.tscn").instance()
			add_child(hex)
			if x % 2 == 0:
				hex.global_transform.origin = Vector3( (w*offest)*x , 0, (0.87*h)*z )
				print("even")
			else:
				hex.global_transform.origin = Vector3( (w*offest)*x , 0, (0.87*h)*z + offest)
				print("odd")
