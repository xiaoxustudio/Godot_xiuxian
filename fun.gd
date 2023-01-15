extends Control

var Sen= null

var gamepath = "user://savegame.save"

var Game_data_all

func _ready():
	Sen=get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1)


var sce_var=[]

#当前窗口npc数据数组
var npc_windows_data=[]


func setSce(a,b=null):
	if b and typeof(b)==TYPE_ARRAY:
		sce_var=b.duplicate(true)
	Sen.queue_free()
	var s=load(a)
	Sen=s.instance()
	get_tree().get_root().add_child(Sen)

#获取界面传参参数
func get_sen_var():
	return sce_var


#渡劫期暂时未定
func zhcode(te):
	if te=="锻体":
		return "练气"
	elif te=="练气":
		 return "筑基"
	elif te=="筑基":
		 return "结丹"
	elif te=="结丹":
		 return "元婴"
	elif te=="元婴":
		 return "化神"
	elif te=="化神":
		 return "炼虚"
	elif te=="炼虚":
		 return "合体"
	elif te=="合体":
		 return "大乘"
	elif te=="大乘":
		 return "渡劫"
	

#突破最大修为计算
func xwzh(te,te1):
	var xwjc=0
	if te=="锻体":
		xwjc=pow((0.10*10),2)*1000
	elif te=="练气":
		 xwjc= pow((0.20*10),2)*5000
	elif te=="筑基":
		 xwjc= pow((0.25*10),2)*10000
	elif te=="结丹":
		 xwjc= pow((0.30*10),2)*15000
	elif te=="元婴":
		 xwjc= pow((0.40*10),2)*25000
	elif te=="化神":
		 xwjc= pow((0.60*10),2)*35000
	elif te=="炼虚":
		 xwjc= pow((0.800*10),2)*40000
	elif te=="合体":
		 xwjc= pow((0.85*10),2)*45000
	elif te=="大乘":
		 xwjc= pow((0.90*10),2)*50000
	elif te=="渡劫":
		 xwjc= pow((1*10),2)*100000
	
	
	if te1=="初期":
		xwjc=xwjc+(xwjc*0.20)
	elif te1=="中期":
		xwjc=xwjc+(xwjc*0.25)
	elif te1=="后期":
		xwjc=xwjc+(xwjc*0.30)
	elif te1=="圆满":
		xwjc=xwjc+(xwjc*0.45)
	elif te1=="大圆满":
		xwjc=xwjc+(xwjc*0.50)
	return int(xwjc)
	




func zhcode1(te):
	if te=="初期":
		return "中期"
	elif te=="中期":
		 return "后期"
	elif te=="后期":
		return "圆满"
	elif te=="圆满":
		return "大圆满"
	elif te=="大圆满":
		return "初期"







#1为基础属性，2为物品，3为装备

func tpif(te):
	var ms=tpjson.new()
	var self_item=ms.get_json(Game_data_all)[te]
	var check_switch=[]
	var check_switch_self=[]
	
	for i in self_item.size():
		check_switch.push_back(1)
	
	#突破材料解析
	for k in self_item:
		#属性修为
		if k[1]==1:
			if Game_data_all["修为"]>=k[4]:
				check_switch_self.push_back(1)
			else:
				check_switch_self.push_back(0)
				
		
		#物品
		if k[1]==2:
			for ke in Game_data_all["背包"]:
				if str(Game_data_all["背包"][ke][0])==str(k[0]):
					check_switch_self.push_back(1)
				
			
		
	
	
	if check_switch==check_switch_self:
#		print(check_switch)
#		print(check_switch_self)
		return true
	else:
#		print(check_switch)
#		print(check_switch_self)
		return false
	


func xm_rand():
	var xing=[
		"赵","钱","孙","李","周","吴","郑","王","冯","陈","褚","卫","蒋","沈","韩","杨","朱","秦","尤","许",
		"何","吕","施","张","孔","曹","严","华","金","魏","陶","姜","戚","谢","邹","喻","柏","水","窦","章",
		"云","苏","潘","葛","奚","范","彭","郎","鲁","韦","昌","马","苗","凤","花","方","俞","任","袁","柳",
		"酆","鲍","史","唐","费","廉","岑","薛","雷","贺","倪","汤","滕","殷","罗","毕","郝","邬","安","常",
		"乐","于","时","傅","皮","卞","齐","康","伍","余","元","卜","顾","孟","平","黄","和","穆","萧","尹",
		"姚","邵","湛","汪","祁","毛","禹","狄","米","贝","明","臧","计","伏","成","戴","谈","宋","茅","庞",
		"熊","纪","舒","屈","项","祝","董","梁","杜","阮","蓝","闵","席","季","麻","强","贾","路","娄","危",
		"江","童","颜","郭","梅","盛","林","刁","钟","徐","邱","骆","高","夏","蔡","田","樊","胡","凌","霍",
		"虞","万","支","柯","昝","管","卢","莫","经","房","裘","缪","干","解","应","宗","丁","宣","贲","邓",
		"郁","单","杭","洪","包","诸","左","石","崔","吉","钮","龚","程","嵇","邢","滑","裴","陆","荣","翁",
		"荀","羊","於","惠","甄","麴","家","封","芮","羿","储","靳","汲","邴","糜","松","井","段","富","巫",
		"乌","焦","巴","弓","牧","隗","山","谷","车","侯","宓","蓬","全","郗","班","仰","秋","仲","伊","宫",
		"宁","仇","栾","暴","甘","钭","厉","戎","祖","武","符","刘","景","詹","束","龙","叶","幸","司","韶",
		"郜","黎","蓟","薄","印","宿","白","怀","蒲","邰","从","鄂","索","咸","籍","赖","卓","蔺","屠","蒙",
		"池","乔","阴","郁","胥","能","苍","双","闻","莘","党","翟","谭","贡","劳","逄","姬","申","扶","堵",
		"冉","宰","郦","雍","舄","璩","桑","桂","濮","牛","寿","通","边","扈","燕","冀","郏","浦","尚","农",
		"温","别","庄","晏","柴","瞿","阎","充","慕","连","茹","习","宦","艾","鱼","容","向","古","易","慎",
		"戈","廖","庾","终","暨","居","衡","步","都","耿","满","弘","匡","国","文","寇","广","禄","阙","东",
		"殴","殳","沃","利","蔚","越","夔","隆","师","巩","厍","聂","晁","勾","敖","融","冷","訾","辛","阚",
		"那","简","饶","空","曾","毋","沙","乜","养","鞠","须","丰","巢","关","蒯","相","查","後","荆","红",
		"游","竺","权","逯","盖","益","桓","公","岳","帅","缑","亢","况","后","有","琴","商","牟","佘","佴",
		"伯","赏","墨","哈","谯","笪","年","爱","阳","佟","言","福","仉","督","晋","楚","闫","法","汝","鄢",
		"涂","钦",
	]
	var xing_1=[
		"东方","赫连","皇甫","尉迟","公羊","澹台","公冶","宗政","濮阳",
		"淳于","单于","太叔","申屠","公孙","仲孙","轩辕","令狐","钟离","宇文",
		"长孙","慕容","鲜于","闾丘","司徒","司空","亓官","司寇","子车",
		"颛孙","端木","巫马","公西","漆雕","乐正","壤驷","公良","拓跋","夹谷",
		"宰父","谷梁","段干","百里","东郭","南门",
		"呼延","归","海","羊舌","微生","万俟","司马","上官","欧阳","夏侯","诸葛","梁丘","左丘",
		"东门","西门","南宫","第五",
	]
	
	var ming=[
		"卿","乾","亦","雅","芝",
		"烨","悦","歆","麒","俊",
		"佑","嘉","捷","舒","晟",
		"赫","晗","霆","博","萱","昊",
		"芸","天","岚","昕","尧","鸿",
		"棋","琳","宸","乔","丞","安",
		"毅","凌","惠","珠","玮 泉",
		"坤","恒","渝","菁","龄","弘",
		"佩","勋","宁","元","栋","嘉",
		"哲","俊","博","维","泰","诗 乐",
		"佳","涵","晋","逸","沅","海","圣","亚",
		"宜","可","姬","舒","谚","娅","琦","晔","轩",
		"源","娥","玲","芬","芳","燕","彩","月","美","心",
		"茗","丹","森","学","轩","叶","璧","璐","绍","贝","阳",
		"彬","书","苓","汉","蔚","坚","莎","耘","国","仑","良",
		"裕","融","致","德","卿","桂","娣","易","虹","纲","筠",
		"奇","平","蓓","真","凰","桦","玫","强","沛","汶","锋",
		"园","艺","咏","慈","彦","桭","彬","桸","树","栋","梦",
		"桦","棹","松","柏","枫","荣","橙","根","森","融","蕊",
		"馨","材","梓","延","庭","冠","益","劭","钧","薇","亭",
		"瀚","桓","东","滢","恬","瑾","眉","君","琴","仁","伟",
		"仙","伊","叶","宝","容","枫","芸","妮","娜","承","民",
		"智","棠","胜","荷","丹","蓉","滢","馥","筠","柔","竹",
		"霭","凝","晓","欢","霄","娅","瑞","凡","嘉","琼","勤",
		"蓓","纨","仪","珍","贞","莉","菲","淑","澜","依","毓",
		"悦","昭","冰","爽","琬","茗","羽","希","怡","婵","雁",
		"欣","飘","育","富","枫","霖","志","羚","峰","泽","新",
		"恩","羽","旭","维","家","琰","韵","晴","晶","妍","茜",
		"秋","珊","莎","锦","黛","青","倩","姣","婉","娴","瑾",
		"颖","雯","婕","馨","瑗","兰","凤","洁","琳","薇","菁",
		"梦","岚","苑","琳","素","滢","馥","筠","姬","舒","瑞",
		"祥","童 和","安","晨","曦","璨","炯","泽","润","宁",
	]
	
	randomize()
	#名字长度2，3，4
	var jilv=[0.7,0.8,0.3]
	var suiji=randf()
	randomize()
	var suiji_1=randf()
	randomize()
	var suiji_2=randf()
	if suiji<=jilv[0]:
		#2个名字
		randomize()
		var mz_1=rand_range(0,xing.size())
		randomize()
		var mz_2=rand_range(0,ming.size())
		return xing[mz_1]+ming[mz_2]
	elif suiji_1<=jilv[1]:
		#3个名字
		randomize()
		var mz_1=rand_range(0,xing.size())
		randomize()
		var mz_2=rand_range(0,ming.size())
		randomize()
		var mz_3=rand_range(0,ming.size())
		return xing[mz_1]+ming[mz_2]+ming[mz_3]
	elif suiji_2<=jilv[2]:
		#4个名字
		randomize()
		var mz_1=rand_range(0,xing_1.size())
		randomize()
		var mz_2=rand_range(0,ming.size())
		randomize()
		var mz_3=rand_range(0,ming.size())
		randomize()
		return xing_1[mz_1]+ming[mz_2]+ming[mz_3]
	
	


#境界名称颜色转换
func bb_jj_a(te,jj1):
	var xwjc=""
	var color_tag=""
	if te=="锻体":
		xwjc="锻体"
	elif te=="练气":
		xwjc= "练气"
	elif te=="筑基":
		xwjc= "筑基"
		color_tag="#DEB887"
	elif te=="结丹":
		xwjc= "结丹"
		color_tag="#FFD700"
	elif te=="元婴":
		xwjc= "元婴"
		color_tag="#800080"
	elif te=="化神":
		xwjc= "化神"
		color_tag="#00FA9A"
	elif te=="炼虚":
		xwjc= "炼虚"
		color_tag="#483D8B"
	elif te=="合体":
		xwjc= "合体"
		color_tag="#FF1493"
	elif te=="大乘":
		xwjc= "大乘"
		color_tag="#DC143C"
	elif te=="渡劫":
		xwjc= "渡劫"
	return "[color="+color_tag+"]"+xwjc+jj1+"[/color]"

#寻找守卫npc
func find_npc_s(j,id=0):
	var id1=str(id)
	for i in Game_data_all["世界"][j]["守卫"]:
		if i==id1:
			var n_a=Game_data_all["世界"][j]["守卫"].get(str(i))
			if n_a!=null:
				return n_a
		
	

#寻找npc
func find_npc(j,id=0):
	for i in Game_data_all["世界"][j]["城镇"]:
		var n=i["npc"]
		var n_a=n.get(str(id))
		if n_a!=null:
			return n_a
	


#创建随机npc
func creat_npc_rand(num=1,jj="锻体"):
	var npc={}
	var z_id=0
	var z_jj="初期"
	var z_j="锻体"
	var data1={"初期":1,"中期":2,"后期":3,"圆满":4,"大圆满":5}
	var data2={"锻体":1,"练气":2,"筑基":3,"结丹":4,"元婴":5,"化神":6,"炼虚":7,"合体":8,"大乘":9}
	var data3=["锻体","练气","筑基","结丹","元婴","化神","炼虚","合体","大乘"]
	for _i in range(1,num):
		randomize()
		#限制在指定的境界内
		var suiji=data3[round(rand_range(0,data2[jj]))]
		var c_n=creat_npc(suiji)
		if data1[c_n["境界1"]]>=data1[z_jj] and data2[c_n["境界"]]==data2[z_j]:
			z_jj=c_n["境界1"]
			z_id=c_n.npcid
		
		npc[c_n.npcid]=c_n
		
	
	return [npc,z_id]
	



#创建同一境界npc
func creat_npc_a(num=1,jj="练气"):
	var npc={}
	var z_id=0
	var z_jj="初期"
	var data1={"初期":1,"中期":2,"后期":3,"圆满":4,"大圆满":5}
	for _i in range(1,num):
		var c_n=creat_npc(jj)
		
		if data1[c_n["境界1"]]>=data1[z_jj]:
			z_jj=c_n["境界1"]
			z_id=c_n.npcid
		
		npc[c_n.npcid]=c_n
		
	
	return [npc,z_id]


#数字转换缩进
func num_to(a):
	if a<10000:
		return str(a)
	elif a>=10000 and a<10000000:
		return str(stepify(a/10000,0.01))+"万"
#	elif a>=10000 and a<1000000:
#		return str(stepify(a/10000,0.01))+"万"
#	elif a>=1000000 and a<10000000:
#		return str(stepify(a/1000000,0.01))+"百万"
	elif a>=10000000 and a<100000000:
		return str(stepify(a/10000000,0.01))+"亿"




func save_game():
	var savegame = File.new()
	savegame.open(gamepath,File.WRITE)
	savegame.store_line(to_json(Game_data_all))
	savegame.close()
	load_game()
	

var player_position=""

func load_game():
	var loadgame = File.new()
	if loadgame.file_exists(gamepath):
		loadgame.open(gamepath,File.READ)
		var json_str = loadgame.get_as_text()
		loadgame.close()
		Game_data_all=parse_json(json_str)
		return Game_data_all
		
	else:
		var hyh=creat_npc_rand(10,"筑基")
		var qy=creat_npc_rand(10,"筑基")
		var cz=creat_npc("结丹")
		hyh[0][cz.npcid]=cz
		var hyh_n=hyh[0]
		var cz1=creat_npc("结丹")
		qy[0][cz1.npcid]=cz1
		var qy_n=qy[0]
		Game_data_all={
			"道号":"古虚",
			"灵根":"无",
			"境界":"锻体",
			"境界1":"初期",
			"功德":0,
			"称号":"无",
			"灵石":10000,
			"修为":9999999,
			"最大修为":xwzh("锻体","初期"),
			"背包":{
				#1装备、2丹药，3物品，4材料
				1:["青云剑",1,{is_stack=false,num=1,pinzhi="法器",pinzhi1="下品",},{"add":{"物理攻击":5},"remove":{}}],
				2:["青云衣",1,{is_stack=false,num=1,pinzhi="法器",pinzhi1="下品",},{"add":{"防御":2},"remove":{}}],
				3:["筑基丹",2,{is_stack=true,num=1,pinzhi="二品",pinzhi1="初香",description="进阶筑基期需要的丹药"}],
				4:["魂阴令",3,{is_stack=true,num=1,description="进出魂阴海的令牌"}]
			},
			"突破概率":100,
			"最大背包":60,
			"气血":100,
			"物理攻击":3,
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
			"加成":{
				"气血":100,
				"物理攻击":3,
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
			},
			"世界":{
				"魂阴海":{
					"凡人":1000000,
					"灵气浓度":1.0,
					"等级":"一阶",
					"通行信物":"魂阴令",
					"域主id":cz.npcid,
					"守卫":creat_npc_a(3,"筑基")[0],
					"城镇":[
						{
							"名称":"永夜城",
							"等级":"小型",
							"npc":hyh_n,
						},
					]
				},
				"青玉":{
					"凡人":4000000,
					"灵气浓度":1.0,
					"等级":"一阶",
					"通行信物":"青玉令",
					"域主id":cz1.npcid,
					"守卫":creat_npc_a(3,"筑基")[0],
					"城镇":[
						{
							"名称":"永夜城",
							"等级":"小型",
							"npc":qy_n,
						},
					]
				},
			}
			}
		save_game()
		return Game_data_all
	
	



func jx_num(te,te1):
	var data={"初期":1,"中期":2,"后期":3,"圆满":4,"大圆满":5}
	var data_1={"锻体":1,"练气":1,"筑基":6,"结丹":11,"元婴":16,"化神":21,"炼虚":26,"合体":31,"大乘":36,}
	return data[te1]+data_1[te]





func creat_npc(a="练气"):
	randomize()
	var jj1=["初期","中期","后期","圆满","大圆满"][round(rand_range(0,4))]
	var xw=xwzh(a,jj1)#报错指针会跳到这里
	randomize()
	var num=jx_num(a,jj1)
	var state_da={
		"境界":a,
		"境界1":jj1,
		"气血":100,
		"物理攻击":3,
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
	var tp_data=tpjson.new().get_json(state_da)
	for _i in range(1,num):
		state_da["气血"]=int(tp_data[str(state_da["境界"]+"突破")]["气血"][0])+state_da["气血"]
		state_da["物理攻击"]=int(tp_data[str(state_da["境界"]+"突破")]["物理攻击"][0])+state_da["物理攻击"]
		state_da["速度"]=int(tp_data[str(state_da["境界"]+"突破")]["速度"][0])+state_da["速度"]
		state_da["灵气"]=int(tp_data[str(state_da["境界"]+"突破")]["灵气"][0])+state_da["灵气"]
	
	var dh=xm_rand()
	if dh==null :
		dh=xm_rand()
	var status={
		"道号":dh,
		"境界":a,
		"npcid":round(rand_range(1000000,9999999)),
		"境界1":jj1,
		"修为":round(rand_range(1,xw)),
		"最大修为":xw,
		"气血":state_da["气血"],
		"物理攻击":state_da["物理攻击"],
		"物理防御":state_da["物理防御"],
		"法术攻击":state_da["法术攻击"],
		"法术防御":state_da["法术防御"],
		"速度":state_da["速度"],
		"灵气":state_da["灵气"],
		"幸运":state_da["幸运"],
		"暴击":state_da["暴击"],
		"暴击效果":state_da["暴击效果"],
		"闪避":state_da["闪避"],
		"闪避几率":state_da["闪避几率"],
		"格挡":state_da["格挡"],
		"格挡效果":state_da["格挡效果"],
		
	}
	return status



func del_game():
	var dic=Directory.new()
	return dic.remove(gamepath)


func add_goods(data):
	var bbdata=Game_data_all["背包"]
	for i in bbdata:
		if str(bbdata[i][0])==str(data[0]):
			bbdata[i][2]["num"]=int(bbdata[i][2]["num"]+data[2]["num"])
			Game_data_all["背包"]=bbdata
			save_game()
			return true
		
		if int(i)>bbdata.size():
			bbdata[str(i)]=to_json(str(data))
			Game_data_all["背包"]=bbdata
			save_game()
			return true
		




#按名称查找物品
func find_goods(te):
	var bbdata=Game_data_all["背包"]
	for i in bbdata:
		if str(bbdata[i][0])==str(te):
			return bbdata[i]
		
		if int(i)>=bbdata.size():
			return false
		
	


#移除物品
func remove_goods(te,g_num):
	var bbdata=Game_data_all["背包"]
	for i in bbdata:
		if str(bbdata[i][0])==str(te):
			if int(g_num)>=bbdata[i][2]["num"]:
				var r_data=bbdata.erase(i)
				Game_data_all["背包"]=bbdata
				save_game()
				return r_data
			else:
				bbdata[i][2]["num"]=int(bbdata[i][2]["num"]-int(g_num))
				Game_data_all["背包"]=bbdata
				save_game()
				return true
			
		
		if int(i)>=bbdata.size():
			return false
		
	


#突破物品移除
func tp_remove_goods(te):
	var ms=tpjson.new()
	var self_item=ms.get_json(Game_data_all)[te]
	var check_switch=[]
	var check_switch_self=[]
	
	for i in self_item.size():
		check_switch.push_back(1)
	
	#突破材料解析
	for k in self_item:
		#属性修为
		if k[1]==1:
			if Game_data_all["修为"]>=k[4]:
				Game_data_all["修为"]=Game_data_all["修为"]-k[4]
				check_switch_self.push_back(1)
			else:
				check_switch_self.push_back(0)
				
		
		#物品
		if k[1]==2:
			for ke in Game_data_all["背包"]:
				if str(Game_data_all["背包"][ke][0])==str(k[0]):
					var data_this=Game_data_all["背包"][ke]
					if data_this[2]["num"]<=1:
						#我设定的键值是从1开始
						print(ke)
						Game_data_all["背包"].erase(str(ke))
						print(Game_data_all["背包"])
						#Game_data_all["背包"]=Game_data_all["背包"]#重发
						save_game()
						check_switch_self.push_back(1)
					else:
						Game_data_all["背包"][ke][2]["num"]=int(data_this[2]["num"])-int(k[2]["num"])
						#Game_data_all["背包"]=Game_data_all["背包"]#重发
						save_game()
						check_switch_self.push_back(1)
					
				
			
		
	
	
	if check_switch==check_switch_self:
#		print(check_switch)
#		print(check_switch_self)
		return true
	else:
#		print(check_switch)
#		print(check_switch_self)
		return false
	


