extends Control



func data_npc(a):
	var the_base_npc=load("res://fun/Worldmap/base_npc.tscn").instance()
	the_base_npc.init_ready(a)
	$Panel2/grid.add_child(the_base_npc)



func _ready():
	Fun.load_game()
	var this_data=Fun.get_sen_var()
	
	var yzid=str(Fun.Game_data_all["世界"][this_data[0]]["域主id"])
	var yzsz=Fun.find_npc(this_data[0],yzid)
	$Panel/Label.text=this_data[0]
	$Panel/Label2.text="进入此界需出示"+Fun.Game_data_all["世界"][this_data[0]]["通行信物"]
	$Panel2/Label.text="当前区域城镇数:"+str(Fun.Game_data_all["世界"][this_data[0]]["城镇"].size())
	$Panel2/Label2.bbcode_text="[center]当前域主："+yzsz["道号"]+"【"+Fun.bb_jj_a(yzsz["境界"],yzsz["境界1"])+"】[center]"
	$Panel2/Label3.text="当前区域凡人数量："+Fun.num_to(Fun.Game_data_all["世界"][this_data[0]]["凡人"])
	for i in Fun.Game_data_all["世界"][this_data[0]]["守卫"]:
		data_npc(Fun.Game_data_all["世界"][this_data[0]]["守卫"][i])
		



