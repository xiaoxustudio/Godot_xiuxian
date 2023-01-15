extends Popup


var game_data

func update_show():
	game_data=Fun.Game_data_all
	
	#标签1显示
	if game_data["境界1"]=="大圆满":
			var zhafter=Fun.zhcode(game_data["境界"])
			var zhafter1=Fun.zhcode1(game_data["境界1"])
			$Panel/Label.text=game_data["境界"]+game_data["境界1"]+"—>"+zhafter+zhafter1
	else:
			var zhafter1=Fun.zhcode1(game_data["境界1"])
			$Panel/Label.text=game_data["境界"]+game_data["境界1"]+"—>"+game_data["境界"]+zhafter1
	
	
	#标签2显示
	if game_data["境界1"]=="大圆满":
		#判断大圆满条件
		if Fun.tpif(game_data["境界"]):
			$Panel/Label2.text="突破条件：满足"
		else:
			$Panel/Label2.text="突破条件：不满足"
	else:
		#判断其他阶段条件
#		var test_jj="锻体"
#		print(Fun.xwzh(test_jj,"初期"))
#		print(Fun.xwzh(test_jj,"中期"))
#		print(Fun.xwzh(test_jj,"后期"))
#		print(Fun.xwzh(test_jj,"圆满"))
#		print(Fun.xwzh(test_jj,"大圆满"))
		if game_data["修为"]>=game_data["最大修为"]:
			$Panel/Label2.text="突破条件：满足"
		else:
			$Panel/Label2.text="突破条件：不满足"
			
		
		
		
	
	

func _ready():
	popup()
	update_show()
	



func _on_Button_button_down():
	if game_data["修为"]>=game_data["最大修为"]:
		if game_data["境界1"]=="大圆满":
			if Fun.tpif(game_data["境界"]):
				game_data["修为"]=game_data["修为"]-game_data["最大修为"]
				game_data["境界"]=Fun.zhcode(game_data["境界"])
				game_data["境界1"]=Fun.zhcode1(game_data["境界1"])
				game_data["最大修为"]=Fun.xwzh(game_data["境界"],game_data["境界1"])
				#突破属性加成
				var test1=tpjson.new().get_json(game_data)
				game_data["气血"]=int(test1[str(game_data["境界"]+"破境")]["气血"][0])+game_data["气血"]
				game_data["物理攻击"]=int(test1[str(game_data["境界"]+"破境")]["物理攻击"][0])+game_data["物理攻击"]
				game_data["速度"]=int(test1[str(game_data["境界"]+"破境")]["速度"][0])+game_data["速度"]
				game_data["灵气"]=int(test1[str(game_data["境界"]+"破境")]["灵气"][0])+game_data["灵气"]
				Fun.tp_remove_goods(game_data["境界"])
				Fun.Game_data_all=game_data
				update_show()
		else:
			game_data["修为"]=game_data["修为"]-game_data["最大修为"]
			game_data["境界1"]=Fun.zhcode1(game_data["境界1"])
			game_data["最大修为"]=Fun.xwzh(game_data["境界"],game_data["境界1"])
			#突破属性加成
			var test1=tpjson.new().get_json(game_data)
			game_data["气血"]=int(test1[str(game_data["境界"]+"突破")]["气血"][0])+game_data["气血"]
			game_data["物理攻击"]=int(test1[str(game_data["境界"]+"突破")]["物理攻击"][0])+game_data["物理攻击"]
			game_data["速度"]=int(test1[str(game_data["境界"]+"突破")]["速度"][0])+game_data["速度"]
			game_data["灵气"]=int(test1[str(game_data["境界"]+"突破")]["灵气"][0])+game_data["灵气"]
			
			Fun.Game_data_all=game_data
			update_show()
			
			
		Fun.save_game()
	else:
		#print("条件不满足")
		pass
	
