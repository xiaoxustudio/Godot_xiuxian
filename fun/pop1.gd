extends Popup

var data={}

func _ready():
	popup()
	data=Fun.Game_data_all
	#第一栏
	$Panel/Panel/Label.text="道号："+data["道号"]
	$Panel/Panel/Label2.text="灵根："+data["灵根"]
	$Panel/Panel/Label3.text="称号："+data["称号"]
	$Panel/Panel/Label4.text="修为："+String(data["修为"])+"/"+String(data["最大修为"])
	$Panel/Panel/Label5.text="功德："+String(data["功德"])
	$Panel/Panel/Label6.text="境界："+data["境界"]+data["境界1"]
	$Panel/Panel/Label7.text="灵石："+String(data["灵石"])
	#第二栏
	$Panel/Panel3/Label.text="气血："+String(data["气血"])
	$Panel/Panel3/Label2.text="物理攻击："+String(data["物理攻击"])
	$Panel/Panel3/Label3.text="物理防御："+String(data["物理防御"])
	$Panel/Panel3/Label4.text="法术攻击："+String(data["法术攻击"])
	$Panel/Panel3/Label5.text="法术防御："+String(data["法术防御"])
	$Panel/Panel3/Label6.text="速度："+String(data["速度"])
	$Panel/Panel3/Label7.text="灵气："+String(data["灵气"])
	#第三栏
	$Panel/Panel2/Label.text="闪避："+String(data["闪避"])
	$Panel/Panel2/Label2.text="闪避几率："+String(data["闪避几率"])
	$Panel/Panel2/Label3.text="格挡："+String(data["格挡"])
	$Panel/Panel2/Label4.text="格挡效果："+String(data["格挡效果"])
	$Panel/Panel2/Label5.text="暴击："+String(data["暴击"])
	$Panel/Panel2/Label6.text="暴击效果："+String(data["暴击效果"])
	$Panel/Panel2/Label7.text="幸运："+String(data["幸运"])
	


