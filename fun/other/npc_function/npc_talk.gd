extends Popup
var message_text=[]
var text_speed=0.05
var index_message=0

var check=false
var is_ok

func show_this():
	is_ok=false
	$Label.text=Fun.find_npc_s(Fun.sce_var[0],str(Fun.npc_windows_data[0]))["道号"]
	$Panel/rtext.bbcode_text=message_text[index_message]
	$Panel/rtext.percent_visible=0
	var time_message=text_speed*message_text[index_message].length()
	$tw.interpolate_property($Panel/rtext,"percent_visible",0,1,time_message,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$tw.start()


func _ready():
	randomize()
	message_text=npc_msg.new(Fun.npc_windows_data[1]).g()
	index_message=round(rand_range(0,message_text.size()-1))
	show_this()






func _input(event):
	if event is InputEvent:
		if Input.is_action_just_pressed("m_right"):
			self.visible=false
			if $tw.is_active() :
				$tw.stop_all()




