extends Popup


var npc_talk=load("res://fun/other/npc_function/npc_talk.tscn").instance()
var npc_action=load("res://fun/action.tscn").instance()

func _init_button(fs,lx):
	if fs=="对话":
		if lx=="守卫":
			$".".add_child(npc_talk)
			npc_talk.popup()
	if fs=="切磋":
		if lx=="守卫":
			self.visible=false
			get_parent().get_parent().get_parent().get_parent().add_child(npc_action)
			npc_action.set_player(Fun.Game_data_all)
			npc_action.set_em(Fun.find_npc_s(Fun.sce_var[0],Fun.npc_windows_data[0]))
	
	



#交互按钮
func _int_button(lx):
	if lx=="守卫":
		var duihua=Button.new()
		duihua.text="对话"
		duihua.connect("button_down",self,"_init_button",["对话",lx])
		$P/P4/grid.add_child(duihua)
		var jiyu=Button.new()
		jiyu.text="给与"
		$P/P4/grid.add_child(jiyu)
		
		var qiecuo=Button.new()
		qiecuo.text="切磋"
		$P/P4/grid.add_child(qiecuo)
		qiecuo.connect("button_down",self,"_init_button",["切磋",lx])
		var jincheng=Button.new()
		jincheng.text="进城"
		$P/P4/grid.add_child(jincheng)
		
		




func int_this(data,lx="守卫"):
	#1守卫,2城镇npc
	if data:
		if lx=="守卫":
			$P/P/Label.text=data["道号"]
			$P/P2/Label.text="修为:"+str(data["修为"])+"/"+str(data["最大修为"])
			$P/P3/Label.bbcode_text="[center]境界:"+Fun.bb_jj_a(data["境界"],data["境界1"])+"[/center]"
		#设置当前打开窗口npcid
		Fun.npc_windows_data=[data.npcid,"守卫"]
	_int_button(lx)






