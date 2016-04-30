$(function(){
	//添加减少答辩题目
	var $addBtn = $('#tianjiatimu'),
	$deleteBtn = $('#shanchutimu'),
	$content = $('#caozuodabianxinxi');

	$addBtn.on('click', function() {
		var $content_child = '<div class="form-group pull-left" id="dabiantimutiaomu"><label for="dabianxiaozutimu">答辩小组题目</label><div class="input-group"><span class="input-group-addon"><input type="checkbox"></span><input type="text" class="form-control" id="dabianxiaozutimu" placeholder="填写并勾选答辩小组题目以免分配题目时无题目选择" style="width: 590px"></div></div>';

		$content.children('div').last().before($content_child);
	});
	$deleteBtn.on('click', function(){
		$content.children('#dabiantimutiaomu').last().remove();
	});

	//处理加分请求 同意不同意都是减少条目
	(function (){
		var $content = $('#jiafenqingqiutiaomu');

		$content.on('click','button', function(){
			$(this).parents('form').remove();
		});

	})();

	//平时作业
	(function (){
		var $primary = $('#pingshizuoye_add').parent(),
		$addBtn = $('#pingshizuoye_add'),
		$deleteBtn = $('#pingshizuoye_delete'),
		$pingshi_list = $('#pingshi_list'),
		itemIndex = 0,
		$pingshi_content = $('#pingshi_content'),
		pingshiNumber = 4;//假设取得服务器数据为4次

		function addContent(){//定义增加函数
			
			var ulLen = $pingshi_list.children('li').length,
			tplVar = ulLen + 1,
			percent = Math.round(100/tplVar) + '%';

			var $presentation = '<li role="presentation" dat-index="'+tplVar+'"><a href="#pingshizuoyeNo'+tplVar+'" aria-controls="pingshizuoyeNo'+tplVar+'" role="tab" data-toggle="tab"><p class="list-group-item-text">第'+ tplVar +'次</p><p class="list-group-item-text per_cent">'+ percent +'</p></a></li>';

			var $tabTplCon = '<div role="tabpanel" class="tab-pane" dat-con-index="'+tplVar+'" id="pingshizuoyeNo'+tplVar+'"><div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true"><div class="panel panel-default"><div class="panel-heading" role="tab" id="pingshizuoyeNo'+tplVar+'headingOne"><h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#pingshizuoyeNo'+tplVar+'collapseOne" aria-expanded="true" aria-controls="pingshizuoyeNo'+tplVar+'collapseOne">发布平时作业</a></h4></div><div id="pingshizuoyeNo'+tplVar+'collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="pingshizuoyeNo'+tplVar+'headingOne"><div class="panel-body"><!-- 基本组成表单开始 --><form class="jiafenxuanxiang"><div class="clearfix"><div class="form-group pull-left" style="width: 220px;margin-right: 15px;"><label for="manfen">满分</label><div class="input-group"><input type="text" class="form-control" id="manfen" placeholder="添加分数"><div class="input-group-addon">分</div></div></div><div class="form-group pull-left" style="width: 394px"> <label for="pingdingren">评定人</label><input type="text" class="form-control" id="pingdingren" placeholder="作业评定人"></div><div class="form-group pull-left" style="width: 220px"><label for="fabushijian">发布时间</label><div class="input-group"><input type="text" class="form-control" id="fabushijian" placeholder="格式：2016-04-23"><div class="input-group-addon">日期</div></div></div><div class="form-group pull-left col-md-4"><label for="jiezhishijian">截至时间</label><div class="input-group"><input type="text" class="form-control" id="jiezhishijian" placeholder="格式：2016-05-23"><div class="input-group-addon">日期</div></div></div><div class="form-group pull-left"><label for="tijiaofangshi">提交方式</label><select class="form-control" id="tijiaofangshi" style="width: 170px"><option selected="selected">线上提交</option><option>线下提交</option></select></div><div class="form-group pull-left"><label for="timujixiangqing">题目及详情</label><textarea class="form-control" rows="3" cols="84" id="timujixiangqing" placeholder="请填写作业的题目以及详细要求。格式为（题目：...要求：...）"></textarea></div><div class="pull-left"><button type="button" class="btn btn-primary">发布给学生</button><button type="button" class="btn btn-success">提交作业题目</button><button type="button" class="btn btn-danger">清空上述选项</button></div></div></form><!-- 基本组成表单结束 --></div></div></div><div class="panel panel-default"><div class="panel-heading" role="tab" id="pingshizuoyeNo'+tplVar+'headingTwo"><h4 class="panel-title"><a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#pingshizuoyeNo'+tplVar+'collapseTwo" aria-expanded="false" aria-controls="pingshizuoyeNo'+tplVar+'collapseTwo">添加平时作业成绩</a></h4><button type="button" class="btn btn-success btn-xs pull-right" style="margin-top: -20px;margin-left: 10px;" id="baocunmuqiancaozuo">提交目前操作</button><button type="button" class="btn btn-primary btn-xs pull-right" style="margin-top: -20px;margin-left: 10px;" id="baocunmuqiancaozuo">发布作业成绩给学生</button></div><div id="pingshizuoyeNo'+tplVar+'collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pingshizuoyeNo'+tplVar+'headingTwo"><div class="panel-body"><!-- 表格开始 --><table class="table table-bordered table-hover table-striped"><thead><tr><th>学生编号</th><th>学生姓名</th><th>是否提交</th><th>下载作业</th><th>给予成绩</th></tr></thead><tbody><tr><td>2011210045</td><td>神一豪</td><td>提交</td><td><button type="button" class="btn btn-default" id="xiazaizuoye">下载作业</button></td><td><div class="input-group" style="width: 200px"><input type="text" class="form-control" id="zuoyefenshu" placeholder="添加分数"><div class="input-group-addon">分</div></div></td></tr><tr><td>2011210046</td><td>王豆豆</td><td>未提交</td><td><button type="button" class="btn btn-default" id="xiazaizuoye">下载作业</button></td><td><div class="input-group" style="width: 200px"><input type="text" class="form-control" id="zuoyefenshu" placeholder="添加分数"><div class="input-group-addon">分</div></div></td></tr></tbody></table><!-- 表格结束 --></div></div></div><div class="panel panel-default"><div class="panel-heading" role="tab" id="pingshizuoyeNo'+tplVar+'headingThree"><h4 class="panel-title"><a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#pingshizuoyeNo'+tplVar+'collapseThree" aria-expanded="false" aria-controls="pingshizuoyeNo'+tplVar+'collapseThree">平时作业统计结果</a></h4></div><div id="pingshizuoyeNo'+tplVar+'collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="pingshizuoyeNo'+tplVar+'headingThree"><div class="panel-body"><!-- 表单开始 --><table class="table table-bordered table-hover table-striped"><thead><tr><th>学生编号</th><th>学生姓名</th><th>是否提交</th><th>给予成绩</th></tr></thead><tbody><tr><td>2011210045</td><td>神一豪</td><td>提交</td><td>8</td></tr><tr><td>2011210046</td><td>王豆豆</td><td>未提交</td><td>0</td></tr></tbody></table><!-- 表单结束 --></div></div></div></div></div>';

			$primary.before($presentation);	
			$pingshi_content.append($tabTplCon);
			$pingshi_list.find('.per_cent').html(percent);
		}

		for (var i = 0; i < pingshiNumber - 1; i++) {
			addContent();
		}//加载的时候把次数全部生成

		$addBtn.on('click',function(){
			addContent();
		});

		$deleteBtn.on('click',function(){
			
			var ulLen = $pingshi_list.children('li').length,
			tplVar = ulLen - 1,
			percent = Math.round(100/tplVar) +'%';

			$pingshi_list.children("li").last().remove();
			$pingshi_content.children('.tab-pane').last().remove();

			$pingshi_list.find('.per_cent').html(percent);

		});

		$pingshi_list.on('click', 'li', function (){
			itemIndex = $(this).index();
			console.log(itemIndex + 1);
		});

	})();

	//大作业
	(function (){
		var $primary = $('#dazuoye_add').parent(),
		$addBtn = $('#dazuoye_add'),
		$deleteBtn = $('#dazuoye_delete'),
		$dazuoye_list = $('#dazuoye_list'),
		itemIndex = 0,
		$dazuoye_content = $('#dazuoye_content'),
		dazuoyeNumber = 2;//假设取得服务器数据为4次

		function addContent(){//定义增加函数
			
			var ulLen = $dazuoye_list.children('li').length,
			tplVar = ulLen + 1,
			percent = Math.round(100/tplVar) + '%';

			var $presentation = '<li role="presentation" dat-index="'+tplVar+'"><a href="#dazuoyeNo'+tplVar+'" aria-controls="dazuoyeNo'+tplVar+'" role="tab" data-toggle="tab"><p class="list-group-item-text">第'+tplVar+'次</p><p class="list-group-item-text per_cent">'+ percent +'</p></a></li>';

			var $tabTplCon = '<div role="tabpanel" class="tab-pane" dat-con-index="'+tplVar+'" id="dazuoyeNo'+tplVar+'"><div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true"><div class="panel panel-default"><div class="panel-heading" role="tab" id="dazuoyeNo'+tplVar+'headingOne"><h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#accordion" href="#dazuoyeNo'+tplVar+'collapseOne" aria-expanded="true" aria-controls="dazuoyeNo'+tplVar+'collapseOne">发布大作业</a></h4></div><div id="dazuoyeNo'+tplVar+'collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="dazuoyeNo'+tplVar+'headingOne"><div class="panel-body"><form class="jiafenxuanxiang"><div class="clearfix"><div class="form-group pull-left" style="width: 220px;margin-right: 15px;"><label for="manfen">满分</label><div class="input-group"><input type="text" class="form-control" id="manfen" placeholder="添加分数"><div class="input-group-addon">分</div></div></div><div class="form-group pull-left" style="width: 394px"><label for="pingdingren">评定人</label><input type="text" class="form-control" id="pingdingren" placeholder="作业评定人"></div><div class="form-group pull-left" style="width: 220px"><label for="fabushijian">发布时间</label><div class="input-group"><input type="text" class="form-control" id="fabushijian" placeholder="格式：2016-04-23"><div class="input-group-addon">日期</div></div></div><div class="form-group pull-left col-md-4"><label for="jiezhishijian">截至时间</label><div class="input-group"><input type="text" class="form-control" id="jiezhishijian" placeholder="格式：2016-05-23"><div class="input-group-addon">日期</div></div></div><div class="form-group pull-left"><label for="tijiaofangshi">提交方式</label><select class="form-control" id="tijiaofangshi" style="width: 170px"><option selected="selected">线上提交</option><option>线下提交</option></select></div><div class="form-group pull-left"><label for="timujixiangqing">题目及详情</label><textarea class="form-control" rows="3" cols="84" id="timujixiangqing" placeholder="请填写作业的题目以及详细要求。格式为（题目：...要求：...）"></textarea></div><div class="pull-left"><button type="button" class="btn btn-primary">发布给学生</button><button type="button" class="btn btn-success">提交作业题目</button><button type="button" class="btn btn-danger">清空上述选项</button></div></div></form></div></div></div><div class="panel panel-default"><div class="panel-heading" role="tab" id="dazuoyeNo'+tplVar+'headingTwo"><h4 class="panel-title"><a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#dazuoyeNo'+tplVar+'collapseTwo" aria-expanded="false" aria-controls="dazuoyeNo'+tplVar+'collapseTwo">添加大作业成绩</a></h4><button type="button" class="btn btn-success btn-xs pull-right" style="margin-top: -20px;margin-left: 10px;" id="baocunmuqiancaozuo">提交目前操作</button><button type="button" class="btn btn-primary btn-xs pull-right" style="margin-top: -20px;margin-left: 10px;" id="baocunmuqiancaozuo">发布作业成绩给学生</button></div><div id="dazuoyeNo'+tplVar+'collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="dazuoyeNo'+tplVar+'headingTwo"><div class="panel-body"><table class="table table-bordered table-hover table-striped"><thead><tr><th>学生编号</th><th>学生姓名</th><th>是否提交</th><th>下载作业</th><th>给予成绩</th></tr></thead><tbody><tr><td>2011210045</td><td>神一豪</td><td>提交</td><td><button type="button" class="btn btn-default" id="xiazaizuoye">下载作业</button></td><td><div class="input-group" style="width: 200px"><input type="text" class="form-control" id="zuoyefenshu" placeholder="添加分数"><div class="input-group-addon">分</div></div></td></tr><tr><td>2011210046</td><td>王豆豆</td><td>未提交</td><td><button type="button" class="btn btn-default" id="xiazaizuoye">下载作业</button></td><td><div class="input-group" style="width: 200px"><input type="text" class="form-control" id="zuoyefenshu" placeholder="添加分数"><div class="input-group-addon">分</div></div></td></tr></tbody></table></div></div></div><div class="panel panel-default"><div class="panel-heading" role="tab" id="dazuoyeNo'+tplVar+'headingThree"><h4 class="panel-title"><a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#dazuoyeNo'+tplVar+'collapseThree" aria-expanded="false" aria-controls="dazuoyeNo'+tplVar+'collapseThree">大作业统计结果</a></h4></div><div id="dazuoyeNo'+tplVar+'collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="dazuoyeNo'+tplVar+'headingThree"><div class="panel-body"><table class="table table-bordered table-hover table-striped"><thead><tr><th>学生编号</th><th>学生姓名</th><th>是否提交</th><th>给予成绩</th></tr></thead><tbody><tr><td>2011210045</td><td>神一豪</td><td>提交</td><td>80</td></tr><tr><td>2011210046</td><td>王豆豆</td><td>未提交</td><td>0</td></tr></tbody></table></div></div></div></div></div>';

			$primary.before($presentation);	
			$dazuoye_content.append($tabTplCon);
			$dazuoye_list.find('.per_cent').html(percent);
		}

		for (var i = 0; i < dazuoyeNumber - 1; i++) {
			addContent();
		}//加载的时候把次数全部生成

		$addBtn.on('click',function(){
			addContent();
		});

		$deleteBtn.on('click',function(){
			
			var ulLen = $dazuoye_list.children('li').length,
			tplVar = ulLen - 1,
			percent = Math.round(100/tplVar) +'%';

			$dazuoye_list.children("li").last().remove();
			$dazuoye_content.children('.tab-pane').last().remove();
			$dazuoye_list.find('.per_cent').html(percent);

		});

		$dazuoye_list.on('click', 'li', function (){
			itemIndex = $(this).index();
			console.log(itemIndex + 1);
		});


	})();

	//答辩
	(function(){

	})();

});















