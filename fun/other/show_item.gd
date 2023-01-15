extends Control



func get_item_data(data):
	if data:
		$Label.text=data[0]
		#1装备、2丹药，3物品，4材料
		if data[1]==2:
			$Label2.text="丹药"
			$Label3.text=data[2].pinzhi+data[2].pinzhi1
			$des.text=data[2].description
		if data[1]==1:
			$Label2.text="装备"
			$Label3.text=data[2].pinzhi+data[2].pinzhi1
			var text_show=""
			for i in data[3]["add"]:
				if i=="物理攻击":
					text_show+="物理攻击+"+str(data[3]["add"][i])
				if i=="防御":
					text_show+="防御+"+str(data[3]["add"][i])
				if i=="气血":
					text_show+="防御+"+str(data[3]["add"][i])
			
			for i in data[3]["remove"]:
				if i=="物理攻击":
					text_show+="物理攻击+"+str(data[3]["remove"][i])
				if i=="防御":
					text_show+="防御+"+str(data[3]["remove"][i])
				if i=="气血":
					text_show+="防御+"+str(data[3]["remove"][i])
			$des.text=text_show
		
		
		#物品
		if data[1]==3:
			$Label2.text="物品"
			$Label3.text="无"
			$des.text=data[2].description




