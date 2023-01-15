extends Control
var all=[]


func list_updata():
	$Panel/ItemList.clear()
	for i in all:
		$Panel/ItemList.add_item(str(i))
	


func run_code():
	var te=String($Panel/LineEdit.text)
	if te.begins_with("$"):
		match te:
			"$close":
				all.append("关闭当前窗口")
				list_updata()
				get_node(".").get_child(get_child_count()-1).free()
				Fun.setSce("res://Game.tscn")
			"$del_save":
				all.append("指令运行结果："+str(Fun.del_game()))
				Fun.setSce("res://Game.tscn")
			"$open_save":
				OS.execute("explorer",["user://save.savegame"],true)
				all.append("已经打开存档路径")
				list_updata()
			_:
				all.append("未知命令")
				list_updata()
		
	else:
		if " " in te:
			var fadata=te.split(" ")
			var var1=fadata[0]
			var var2=fadata[1]
			if var1=="add":
				var var3=fadata[2]
				match var2:
					"xw":
						var dae=Fun.Game_data_all
						dae["修为"]=int(var3)+dae["修为"]
						Fun.save_game()
						all.append("执行修为添加操作："+var3)
						list_updata()
						
					"goods":
						Fun.add_goods(var3)
						Fun.save_game()
						all.append("执行物品添加操作："+var3)
						list_updata()
						
					
				
			if var1=="change":
				var var3=fadata[2]
				match var2:
					"xw":
						var dae=Fun.Game_data_all
						dae["修为"]=int(var3)
						Fun.save_game()
						all.append("执行修为更改操作："+var3)
						list_updata()
						
					
			
			if var1=="remove":
				var var3=fadata[2]
				var var4=fadata[3]
				match var2:
					"goods":
						Fun.remove_goods(var3,var4)
						Fun.save_game()
						all.append("执行物品移除操作："+var3+",数量:"+var4)
						list_updata()
						
			
			
			
		




func _input(_at):
	if Input.get_action_strength("Enter"):
		run_code()




func _ready():
	list_updata()



func _on_Button_button_down():
	run_code()
