class_name npc_msg
extends Object

#守卫随机对话
var the_sw=[
	"这位修士，我是这里的守卫，您有什么需要帮助？",
	"听说此地附近有中阶妖兽出现，不知是真是假？",
	"道友，你见过在下吗？",
	]


var the_lr=[
	"这位道友可曾见过在下？",
	"道友好",
	"不知道友有何贵干？",
	]


var lx=""

func _init(l_d):
	lx=l_d

func g():
	if lx=="守卫":
		return the_sw
	if lx=="npc":
		return the_lr

