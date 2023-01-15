extends Panel


func _make_custom_tooltip(_for_text):
	var a=preload("res://fun/other/show_text.tscn")
	var a_test = a.instance()
	if Fun.find_goods($Label.text):
		a_test.get_item_data(Fun.find_goods($Label.text))
		return a_test
	else:
		return null



func _on_me():
	#避免在空格子内的tooltip弹出
	if $Label.text=="":
		$".".set_tooltip("")
	else:
		$".".set_tooltip(".")
