class_name Player_obj
extends Object

var obj_data={}
var obj_data_b={}

var type_obj=1

func backup_all():
	obj_data_b=obj_data.duplicate(true)
	return true


func _init(type=1):
	type_obj=type
	obj_data={
		"道号":"古虚",
		"类型":type_obj,#1为玩家、2为怪物，3为npc
		"境界":"锻体",
		"境界1":"初期",
		"气血":100,
		"物理攻击":25,
		"物理防御":0,
		"法术攻击":0,
		"法术防御":0,
		"速度":20,
		"灵气":0,
		"幸运":0,
		"暴击":0,
		"暴击效果":1,
		"闪避":0,
		"闪避几率":0,
		"格挡":0,
		"格挡效果":0,
	}
	backup_all()
	return true

#获取全局data
func get_this():
	return obj_data

#获取data属性
func get_local(sx):
	return obj_data[sx]

#获取备份全局data
func get_this_b():
	return obj_data_b

#获取备份data属性
func get_local_b(sx):
	return obj_data_b[sx]

#设置全局data
func set_this(data):
	obj_data=data.duplicate(true)

#设置备份全局data
func set_this_b(data):
	obj_data_b=data.duplicate(true)

#设置data属性
func set_local(data,content):
	obj_data[data]=content

#设置备份data属性
func set_local_b(data,content):
	obj_data_b[data]=content

#设置传参data
func set_d_only(data):
	data["类型"]=type_obj
	set_this(data)
	set_this_b(data)


#攻击Player_obj，参数传入为Player_obj
func attack(obj_this:Player_obj):
	var l_attack=obj_data["物理攻击"]-obj_this.get_local("物理防御")
	var l_helth=obj_this.get_local("气血")-l_attack
	obj_this.set_local("气血",l_helth)
	return {s_attack=l_attack,s_helth=l_helth,other={}}







