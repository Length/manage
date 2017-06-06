$(document).ready(function () {

	// Graph Data
	var graphData = [{
			// 人员数量
			data: [ [6, 800], [7, 1100], [8, 1000], [9, 1500], [10, 1300], [11, 1900], [12, 1700], [13, 1950], [14, 1900], [15, 2000] ],
			color: '#2dcb73'
		}, {
			// 人脸数量
			data: [ [6, 80], [7, 600], [8, 550], [9, 600], [10, 800], [11, 900], [12, 800], [13, 850], [14, 830], [15, 1000] ],
			color: '#6a94ff',
			points: { radius: 4, fillColor: '#ffffff' }
		}
	];6
	// 线图
	$.plot($('#graph-lines'), graphData, {
		series: {
			points: {
				show: true,
				radius: 5
			},
			lines: {
				show: true
			},
			shadowSize: 0
		},
		grid: {
			color: '#282828',
			borderColor: 'transparent',
			borderWidth: 60,
			hoverable: true
		},
		xaxis: {
			tickColor: 'transparent',
			tickDecimals: 2
		},
		yaxis: {
			tickSize: 500
		}
	});

	// Bars Graph
	$.plot($('#graph-bars'), graphData, {
		series: {
			bars: {
				show: true,
				barWidth: .7,
				align: 'center'
			},
			shadowSize: 0
		},
		grid: {
			color: '#646464',
			borderColor: 'transparent',
			borderWidth: 40,
			hoverable: true
		},
		xaxis: {
			tickColor: 'transparent',
			tickDecimals: 2
		},
		yaxis: {
			tickSize: 500
		}
	});

	// 折线显示
	$('#graph-bars').hide();

	$('#lines').on('click', function(e) {
	    $('#bars').removeClass('active');
	    $('#graph-bars').fadeOut();
	    $(this).addClass('active');
	    $('#graph-lines').fadeIn();
	    e.preventDefault();
	});

	$('#bars').on('click', function(e) {
	    $('#lines').removeClass('active');
	    $('#graph-lines').fadeOut();
	    $(this).addClass('active');
	    $('#graph-bars').fadeIn().removeClass('hidden');
	    e.preventDefault();
	});

	// 鼠标悬停提醒
	function showTooltip(x, y, contents) {
		$('<div id="tooltip">' + contents + '</div>').css({
			top: y - 16,
			left: x + 20
		}).appendTo('body').fadeIn();
	}

	var previousPoint = null;

	$('#graph-lines, #graph-bars').bind('plothover', function (event, pos, item) {
		if (item) {
			if (previousPoint != item.dataIndex) {
				previousPoint = item.dataIndex;
				$('#tooltip').remove();
				var x = item.datapoint[0],
					y = item.datapoint[1];
					showTooltip(item.pageX, item.pageY, y + ' 访客 ');
			}
		} else {
			$('#tooltip').remove();
			previousPoint = null;
		}
	});

});