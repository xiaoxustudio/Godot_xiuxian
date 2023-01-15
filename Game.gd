extends Control



var data={}

func reset():
	data=Fun.load_game()
	Fun.save_game()
	$zhu/Panel/Label.text="道号："+data["道号"]
	$zhu/Panel/Label2.text="境界："+data["境界"]+data["境界1"]
	$zhu/Panel/Label3.text="修为："+String(data["修为"])+"/"+String(data["最大修为"])
	$zhu/Panel/Label4.text="灵石："+String(data["灵石"])
	$zhu/Panel/ProgressBar.value=int(data["修为"])
	$zhu/Panel/ProgressBar.max_value=data["最大修为"]
	


var jz_wait=0

func _on_jztimer():
	if jz_wait>=1:
		jz_wait=0
		$jztimer.stop()
		$jiazai.visible=false
	else:
		jz_wait+=0.1
	$jiazai/jdt.value=jz_wait

func _ready():
	var loadgame = File.new()
	if !loadgame.file_exists(Fun.gamepath):
		$jiazai.visible=true
		$jztimer.start()
	
	reset()
	




var time_wait=0


func _on_Timer_timeout():
	if time_wait>=100:
		time_wait=0
		data["修为"]+=1
	else:
		time_wait+=1
	$zhu/ProgressBar.value=time_wait
	reset()
	Fun.save_game()


func _on_Timer_ready():
	$Timer.start()


func _on_Button_button_down():
	data["修为"]+=1
	Fun.save_game()
	reset()


func on_but():
	var pop1=load("res://fun/pop1.tscn").instance()
	self.add_child(pop1)
	


func _on_Button10_button_down():
	Fun.setSce("res://fun/world.tscn")
	




func _on_Button2_button_down():
	var sen=load("res://console.tscn").instance()
	self.add_child(sen)
	



func _on_bt2():
	var sen=load("res://fun/wp.tscn").instance()
	self.add_child(sen)


func _on_Button7_button_down():
	var sen=load("res://fun/tp.tscn").instance()
	self.add_child(sen)



