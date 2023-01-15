extends Panel




func init_ready(data:Dictionary):
	$Label.text=data["道号"]
	$R.bbcode_text="[center]【"+Fun.bb_jj_a(data["境界"],data["境界1"])+"】[/center]"
	$Label3.text=str(data.npcid)

var pop1=preload("res://fun/other/Popup_npc.tscn").instance()


func _onP(_event):
	if Input.is_action_just_pressed("conclick"):
		var npc_id=$Label3.text
		var this_data=Fun.get_sen_var()
		var npc_data=Fun.find_npc_s(this_data[0],npc_id)
		
		
		if pop1.get_parent()==null:
			if !pop1.visible:
				self.add_child(pop1)
				pop1.popup(Rect2(Vector2(_event.position.x,pop1.rect_position.y),pop1.rect_size))
		else:
			if !pop1.visible:
				pop1.free()
				pop1=load("res://fun/other/Popup_npc.tscn").instance()
				self.add_child(pop1)
				pop1.popup(Rect2(Vector2(_event.position.x,pop1.rect_position.y),pop1.rect_size))
		pop1.int_this(npc_data,$Label2.text)
		
		


