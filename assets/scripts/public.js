// 统计图表-折线图
var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
var lineChartData = {
	labels : ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
	datasets : [
		{
			label: "My First dataset",
			fillColor : "rgba(74,125,254,0.4)",
			strokeColor : "rgba(255,255,255,1)",
			pointColor : "rgba(255,255,255,1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(181,181,181,1)",
			data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
		},
		{
			label: "My Second dataset",
			fillColor : "rgba(144,93,209,0.4)",
			strokeColor : "rgba(151,187,205,1)",
			pointColor : "rgba(151,187,205,1)",
			pointStrokeColor : "#fff",
			pointHighlightFill : "#fff",
			pointHighlightStroke : "rgba(151,187,205,1)",
			data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
		}
	]

}
window.onload = function(){
	var ctx = document.getElementById("canvas").getContext("2d");
	window.myLine = new Chart(ctx).Line(lineChartData, {
		responsive: true
	});
}

//恢复出厂设置警告弹窗
$(function(){
  $(".btn").click(function(){
    $("#warning-modal").modal();
  });
});

//登录页面忘记密码提示
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

//对比门限设置
$(function() {
    var $document   = $(document);
    var selector    = '[data-rangeslider]';
    var $inputRange = $(selector);

    // 数值跟随滑动变化
    function valueOutput(element) {
        var value = element.value;
        var output = element.parentNode.getElementsByTagName('output')[0];

        output.innerHTML = value;
    }

    // Initial value output
    for (var i = $inputRange.length - 1; i >= 0; i--) {
        valueOutput($inputRange[i]);
    };

    // Update value output
    $document.on('input', selector, function(e) {
        valueOutput(e.target);
    });

    // Initialize the elements
    $inputRange.rangeslider({
        polyfill: false
    });

    // 输入框value提交到滑块
    $document.on('click', '#change-value button', function(e) {
        var $inputRange = $('input[type="range"]', e.target.parentNode);
        var value = $('input[type="number"]', e.target.parentNode)[0].value;

        $inputRange
            .val(value)
            .change();
    });
});

//头像上传剪裁
//做个下简易的验证  大小 格式 
$('#avatarInput').on('change', function(e) {
	var filemaxsize = 1024 * 5;//5M
	var target = $(e.target);
	var Size = target[0].files[0].size / 1024;
	if(Size > filemaxsize) {
		alert('图片过大，请重新选择!');
		$(".avatar-wrapper").childre().remove;
		return false;
	}
	if(!this.files[0].type.match(/image.*/)) {
		alert('请选择正确的图片!')
	} else {
		var filename = document.querySelector("#avatar-name");
		var texts = document.querySelector("#avatarInput").value;
		var teststr = texts; //你这里的路径写错了
		testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的
		filename.innerHTML = testend;
	}

});

$(".avatar-save").on("click", function() {
	var img_lg = document.getElementById('imageHead');
	// 截图小的显示框内的内容
	html2canvas(img_lg, {
		allowTaint: true,
		taintTest: false,
		onrendered: function(canvas) {
			canvas.id = "mycanvas";
			//生成base64图片数据
			var dataUrl = canvas.toDataURL("image/jpeg");
			var newImg = document.createElement("img");
			newImg.src = dataUrl;
			imagesAjax(dataUrl)
		}
	});
})

function imagesAjax(src) {
	var data = {};
	data.img = src;
	data.jid = $('#jid').val();
	$.ajax({
		url: "upload-logo.php",
		data: data,
		type: "POST",
		dataType: 'json',
		success: function(re) {
			if(re.status == '1') {
				$('.user_pic img').attr('src',src );
			}
		}
	});
}

// 多人文件上传
$('input[id=file]').change(function() {
    var path = $(this).val();
    path = path.split('＼＼');
    path = path[path.length-1];
    $('.filename').val(path);
});
