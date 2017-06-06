
<%
dim request2
set request2=New UpLoadClass
'request2.Charset="UTF-8"
request2.Open()
%>
<!doctype html>
<html lang="en">
<head>
	<title>恢复出厂设置</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
	<link rel="stylesheet" href="assets/css/tables/daterangepicker.css">

	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="assets/css/public.css">
	<link rel="stylesheet" href="assets/css/charts/charts_main.css">
	<link rel="stylesheet" href="assets/css/single-register.css">

</head>
<body>
	<%
		Set xml = Server.CreateObject("Msxml2.XMLHTTP") '��������
		dim url
		url = "http://localhost/scripts/company_asp.dll"
		dim postdate
		postdate= url
		postdate = url+"?AddUser&name="+request2.Form("name") +"&idcard="+request2.Form("idcard") +"&sex="+request2.Form("sex") +"&birth="+request2.Form("birth") +"&phone="+request2.Form("phone") +"&pic=img/adduser/"+request2.Form("pic")

		xml.Open "GET", postdate, False
		xml.setRequestHeader "If-Modified-Since", "0"
		xml.Send(postdate)

		if xml.responseText = "ok" then
			'Response.Clear
			'Response.write xml.responseText
			Response.write "<script>alert('人员添加成功');</script>"
		Else
 			Response.write "<script>alert('" + xml.responseText +"');</script>"
 		end if

			'Response.Write("<p>name="  + request2.Form("name") +  "</p>")
			'Response.Write("<p>idcard="  + request2.Form("idcard") +  "</p>")
			'Response.Write("<p>sex="  + request2.Form("sex") +  "</p>")
			'Response.Write("<p>birth="  + request2.Form("birth") +  "</p>")
			'Response.Write("<p>phone="  + request2.Form("phone") +  "</p>")
			'Response.Write("<p>pic="  + request2.Form("pic") +  "</p>")
	%>

	<!-- 外层包裹 -->
	<div id="wrapper">
		<!-- 导航栏 -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"><img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="fa fa-arrow-circle-o-left"></i></button>
				</div>
				<form class="navbar-form navbar-left">
					<div class="input-group">
						<input type="text" value="" class="form-control" placeholder="请输入搜索内容">
						<span class="input-group-btn"><button type="button" class="btn btn-primary">搜索</button></span>
					</div>
				</form>

				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown">
								<i class="lnr lnr-alarm"></i>
								<span class="badge bg-danger">5</span>
							</a>
							<ul class="dropdown-menu notifications">
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>你有一条消息</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-danger"></span>你有一条消息</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>你有一条消息</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>你有一条消息</a></li>
								<li><a href="#" class="notification-item"><span class="dot bg-success"></span>你有一条消息</a></li>
								<li><a href="#" class="more">更多消息</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>帮助</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">使用方法</a></li>
								<li><a href="#">问题帮助</a></li>
								<li><a href="#">关于系统</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="assets/img/user.png" class="img-circle" alt="Avatar"> <span>李小明</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>我的信息</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>消息</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>设置</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>退出</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="index.html" class=""><i class="lnr lnr-home"></i> <span>主页</span></a></li>
						<li><a href="#" class=""><i class="lnr lnr-code"></i> <span>人脸布控</span></a></li>
						<li><a href="charts.html" class=""><i class="lnr lnr-chart-bars"></i> <span>数据分析</span></a></li>
						<li>
							<a href="#facePages" data-toggle="collapse" class="active"><i class="lnr lnr-file-empty"></i> <span>人脸库管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="facePages" class="collapse in">
								<ul class="nav">
									<li><a href="single-register.html" class="active">单人注册</a></li>
									<li><a href="batchupload.html" class="">多人注册</a></li>
									<li><a href="store-manage.html" class="">库管理</a></li>
									<li><a href="white-tables.html" class="">白名单管理</a></li>
									<li><a href="black-tables.html" class="">黑名单管理</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#searchPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>人脸检索</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="searchPages" class="collapse ">
								<ul class="nav">
									<li><a href="search.html" class="">名单库内搜索</a></li>
									<li><a href="#" class="">陌生人抓拍检索</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#paraPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>参数设置</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="paraPages" class="collapse ">
								<ul class="nav">
									<li><a href="#" class="">对比门限设置</a></li>
									<li><a href="#" class="">人脸抓拍参数设置</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#sysPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <pan>系统管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="sysPages" class="collapse ">
								<ul class="nav">
									<li><a href="#" class="">用户管理</a></li>
									<li><a href="#" class="">网络设置</a></li>
									<li><a href="#" class="">存储管理</a></li>
									<li><a href="#" class="">平台接入</a></li>
									<li><a href="#" class="">系统日志</a></li>
									<li><a href="#" class="">设备名称</a></li>
									<li><a href="reset.html" class="">恢复出厂设置</a></li>
									<li><a href="#" class="">设备时间设置</a></li>
									<li><a href="#" class="">对比接口设置</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">单人注册</h3>
					<div class="row">
						<div class="col-md-12">
						    <div class="widget-area pattern">

						    <div id='wrap'>
						        <form id="upLoadFileForm"   enctype="multipart/form-data">
						          <input type='file' id='upLoadFile' name="pic" />
						        </form>
						    	<form id='userForm' action="single-register.asp" method="post" enctype="multipart/form-data">
						    		<div id='upload'>
						    			<div class='tip'>点击上传头像</div>
						    			<div class='hoverRemove'></div>
						    			<div id='avatarWrap'>
						                    <div class='loading'>
						                      <div class="loadEffect">
						                          <span></span>
						                      </div>
						                    </div>
						    				<img id='avatar' src='assets/img/bigavatar.png'/>
						    			</div>
						    			<p id='txt'>上传头像</p>
						    			<label class='error'></label>
						    		</div>
						    		<div class='inputWrap'>
						    	 		<span class='property '>姓名:</span>
						    	 		<input class='input' name='name' id='name' placeholder='请输入姓名'>
						    	 		<span class='point'>*</span>
						    		</div>
						    		<div class='inputWrap'>
						    	 		<span class='property'>性别:</span>
						    	 		<select class='input select' name="sex" id='post' placeholder='请选择性别'>
						    	 			<option value='男'>男</option>
						    	 			<option value='女'>女</option>
						    	 		</select>
						    	 		<span class='point'>*</span>
						    		</div>
						    		<div class='inputWrap'>
						    	 		<span class='property'>身份证:</span>
						    	 		<input class='input' name="idcard" placeholder='请输入身份证号'>
						    	 		<span class='point'>*</span>
						    		</div>
						    		<div class='inputWrap'>
						    	 		<span class='property '>住址:</span>
						    	 		<input class='input' name="birth" id='password' placeholder='请输入住址'>
						    		</div>
						    		<div class='inputWrap'>
						    	 		<span class='property'>库类型:</span>
						    	 		<select class='input select'  name='post' id='post'>
						    	 			<option value='一'>一</option>
						    	 			<option value='二'>二</option>
						    	 			<option value='三'>三</option>
						    	 			<option value='四'>四</option>
						    	 		</select>
						    	 		<span class='point'>*</span>
						    		</div>
				    				<div class='inputWrap'>
				    			 		<span class='property'>备注:</span>
										<textarea name="备注" id="remarks" cols="27" rows="6" placeholder="请输入备注"></textarea>
				    				</div>

						    	</form>
						    	<div id='response'></div>
						    </div>
						    <div id='handle'>
						    	<div id="" class='btn confirm'>确定</div>
						    </div>

						    </div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>

	<script src="assets/scripts/public.js"></script>

</body>

</html>
<%
'set request2=nothing
%>
