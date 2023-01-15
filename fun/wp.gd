extends Control




func _ready():
	Fun.save_game()
	var data=Fun.load_game()
	var id=1
	for i in data["背包"]:
			var show_text=String(data["背包"][str(i)][0])
			var show_num=String(data["背包"][str(i)][2]["num"])
			get_node("P/G1/it"+str(id)+"/Label").text=show_text
			get_node("P/G1/it"+str(id)+"/Label2").text="X"+show_num
			id+=1
		
	



func _on_Button_button_down():
	Fun.setSce("res://Game.tscn")
