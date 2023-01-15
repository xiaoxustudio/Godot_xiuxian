extends Control


#实例化一个活动实体
var player=Player_obj.new()


#实例化一个活动实体
var em=Player_obj.new(2)


func updata_this():
	$Panel/Panel/Label.text=player.get_local("道号")
	$Panel/Panel2/Label.text=em.get_local("道号")
	$Panel/Panel/Label2.text=player.get_local("境界")+player.get_local("境界1")
	$Panel/Panel2/Label2.text=em.get_local("境界")+em.get_local("境界1")
	$Panel/Panel/blood_main/v/TextureProgress.max_value=player.get_local_b("气血")
	$Panel/Panel/blood_main/v/TextureProgress.value=player.get_local("气血")
	$Panel/Panel2/blood_main/v/TextureProgress.max_value=em.get_local_b("气血")
	$Panel/Panel2/blood_main/v/TextureProgress.value=em.get_local("气血")




func _ready():
	em.set_local("道号","怪物")
	updata_this()


func set_player(data):
	player.set_d_only(data)



func set_em(data):
	em.set_d_only(data)
	



#战斗信息显示
func _on_Button_button_down():
	if $n_control.visible :
		$Button.text="展开"
		$n_control.visible=false
	else:
		$Button.text="隐藏"
		$n_control.visible=true

#攻击动画
func play_a_to_b():
	$AnimationPlayer.play("attack_anim")

func play_b_to_a():
	$AnimationPlayer.play("attack_anim_one")



#失败界面
func _failure_tscn():
	pass




var zd_direction=1 if player.get_local("速度")>player.get_local("速度") else 2

func _on_Timer_timeout():
	
	if player.get_local("气血")<=0:
		$Timer.stop()
		var zd_text=str(player.get_local("道号")+"气血不足，死亡")
		$n_control/Panel/ItemList.add_item(zd_text)
		return
	
	if em.get_local("气血")<=0:
		$Timer.stop()
		var zd_text=str(em.get_local("道号")+"气血不足，死亡")
		$n_control/Panel/ItemList.add_item(zd_text)
		return
	
	if zd_direction==1:
		var local_this=player.attack(em)
		var zd_text=str(player.get_local("道号")+"攻击了"+em.get_local("道号")+"，对其造成"+String(local_this["s_attack"])+"点伤害")
		
		$n_control/Panel/ItemList.add_item(zd_text)
		play_a_to_b()
		zd_direction=2
		
		updata_this()
		return
	
	if zd_direction==2:
		var local_this=em.attack(player)
		var zd_text=str(em.get_local("道号")+"攻击了"+player.get_local("道号")+"，对其造成"+String(local_this["s_attack"])+"点伤害")
		
		$n_control/Panel/ItemList.add_item(zd_text)
		
		play_b_to_a()
		zd_direction=1
		updata_this()
		return










