// $(function(){
// 	var $options = $('#tianjiakaochaxuanxiang'),
// 	$content = $('#jibenzucheng');

// 	$options.on('click',function(){
// 		var $option_child = '<div class="clearfix"><hr class="divider pull-left" style="width: 580px"><div class="form-group pull-left" style="margin-right: 30px;"><label for="zuchengxiang">组成项</label><select class="form-control" id="zuchengxiang"><option selected="selected">考勤</option><option>平时作业</option><option>大作业</option><option>答辩</option><option>期中考试</option><option>期末考试</option></select></div><div class="form-group pull-left" style="width: 220px;margin-right: 30px;"><label for="bili">比例</label><div class="input-group"><input type="text" class="form-control" id="bili" placeholder="比例"><div class="input-group-addon">%</div></div></div><div class="form-group pull-left" style="width: 220px"><label for="cishu">次数</label><div class="input-group"><input type="text" class="form-control" id="cishu" placeholder="次数"><div class="input-group-addon">次</div></div></div><div class="form-group pull-left"><label for="shuoming">详细说明</label><textarea class="form-control" rows="3" cols="77" id="shuoming" placeholder="请填写类别的详细说明，并确保所有组成项比例总和满足100%"></textarea></div><div class="pull-left"><div class="pull-left"><button type="submit" class="btn btn-success">提 交</button><button type="button" class="btn btn-danger">删 除</button></div></div></div>';

// 		$content.append($option_child);
// 	});
// 	$content.on('click','.btn-danger', function(){
// 		$(this).parents('.clearfix').remove();
// 	});
// });

// $(function(){
// 	var $primary = $('#fyr_add').parent(),
// 	$deleteBtn = $('#fyr_delete').parent(),
// 	$fyrUl = $('#fyr_work_list'),len = $fyrUl.children('li').length;
// 	$primary.on('click',function(){
// 		var $presentation = '<li role="presentation" class="fyr"><a href="#kaoqinNofourth" aria-controls="kaoqinNofourth" role="tab" data-toggle="tab"><p class="list-group-item-text">第四次</p><p class="list-group-item-text">25%</p></a></li>';
		
// 		$primary.before($presentation);	
// 	});
// 	$deleteBtn.on('click',function(){
		
// 		$fyrUl.children().eq(len - 3).remove();
// 	});
// });

//以上参考代码

$(function(){

	//添加减少基本组成
	(function (){
		var $addBtn = $('#tianjiakaochaxuanxiang'),
		$deleteBtn = $('#shanchukaochaxuanxiang'),
		$content = $('#jibenzucheng');
		//添加基本组成条目
		$addBtn.on('click', function() {
			var $content_child = '<div id="test"><a></a><div class="form-group pull-left" style="margin-right: 30px;"><label for="zuchengxiang">组成项</label><select class="form-control" id="zuchengxiang"><option selected="selected">考勤</option><option>平时作业</option><option>大作业</option><option>答辩</option><option>期中考试</option><option>期末考试</option></select></div><div class="form-group pull-left" style="width: 220px;margin-right: 30px;"><label for="bili">比例</label><div class="input-group"><input type="text" class="form-control" id="bili" placeholder="比例"><div class="input-group-addon">%</div></div></div><div class="form-group pull-left" style="width: 220px"><label for="cishu">次数</label><div class="input-group"><input type="text" class="form-control" id="cishu" placeholder="次数"><div class="input-group-addon">次</div></div></div><div class="form-group pull-left"><label for="shuoming">详细说明</label><textarea class="form-control" rows="3" cols="77" id="shuoming" placeholder="请填写类别的详细说明，并确保所有组成项比例总和满足100%"></textarea></div></div>';

			$content.append($content_child);
		});
		//减少基本组成条目
		$deleteBtn.on('click', function(){
			$content.children().last().remove();
		});
	})();

	//添加减少加分选项
	(function (){
		var $addBtn1 = $('#tianjiajiafenxuanxiang'),
		$deleteBtn1 = $('#shanchujiafenxuanxiang'),
		$content1 = $('#jiafenxuanxiang');

		$addBtn1.on('click', function() {
			var $content1_child = '<div id="zidingyijiafenxiang"><div class="form-group pull-left"><label for="zidingyizuchengxiang">自定义组成项</label><input type="text" class="form-control" id="zidingyizuchengxiang" placeholder="自定义组成项" style="width: 600px;"></div><div class="form-group pull-left"><label for="jiafenshuoming">加分说明</label><textarea class="form-control" rows="3" cols="80" id="jiafenshuoming" placeholder="请填写加分的详细说明" style="margin-bottom: 10px;"></textarea></div></div>';

			$content1.append($content1_child);
		});
		$deleteBtn1.on('click', function(){
			$content1.children('#zidingyijiafenxiang').last().remove();
		});
	})();

	// 添加减少一票否决项
	(function (){
		var $addBtn2 = $('#tianjiafoujuexuanxiang'),
		$deleteBtn2 = $('#shanchufoujuexuanxiang'),
		$content2 = $('#yipiaofoujuexiang');

		$addBtn2.on('click', function() {
			var $content2_child = '<div class="form-group pull-left" id="foujuetiaomu"><label for="foujuexiangneirong">勾选并填写一票否决项的内容</label><div class="input-group"><span class="input-group-addon"><input type="checkbox"></span><input type="text" class="form-control" id="foujuexiangneirong" placeholder="否决项内容" style="width: 570px"></div></div>';

			$content2.children('p').before($content2_child);
		});
		$deleteBtn2.on('click', function(){
			$content2.children('#foujuetiaomu').last().remove();
		});
	})();

	//提交基本组成项
	(function () {
		var $subBtn1 = $('#tijiaokaochaxuanxiang');
		$subBtn1.on('click', function () {
			var currentTclassNo = $('#currentTclassNo').val();
			var $biliList = $('.bili');
			var $cishuList = $('.cishu');
			var $shuomingList = $('.shuoming');
			var $zcxList = $('.zcx');
			var jbzcxList = new Array();
			//拼接
			$zcxList.each(function (index) {
				var item = new Object();
				item.zcx = this.value;
				item.bili = $biliList[index].value;
				item.cishu = $cishuList[index].value;
				item.shuoming = $shuomingList[index].value;
				jbzcxList.push(JSON.stringify(item));
			});
			$.post('teacher_create_do.php?do_type=jbzc&tclass_no='+currentTclassNo, {data: JSON.stringify(jbzcxList)}, function (status) {
				var msg = '操作失败！';
				if(status == 1){
					msg = '操作成功！';
				}
				$('#status-tip').text(msg);
			});
			return false;
		});

	})();
	
});










