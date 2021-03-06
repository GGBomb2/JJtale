﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EntryTale.aspx.cs" Inherits="EntryTale" %>


<!DOCTYPE html>

<html >
<head runat="server">
    <title>JJTale Regist</title>
    <!-- Favicon -->
		<link rel="shortcut icon" href="images/favicon.jpg">
<!-- Bootstrap core CSS -->
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>

		<!-- Font Awesome CSS -->
		<link href="fonts/font-awesome/css/font-awesome.css" rel="stylesheet"/>

		<!-- Plugins -->
		<link href="css/animations.css" rel="stylesheet"/>
    		<!-- Worthy core CSS file -->
		<link href="css/style.css" rel="stylesheet"/>
    <!-- Custom css --> 
		<link href="css/custom.css" rel="stylesheet"/>
</head>
<body class="no-trans">
    <div class="scrollToTop"><i class="icon-up-open-big"></i></div>
		<header class="header fixed clearfix navbar navbar-fixed-top">
			<div class="container">
				<div class="row">
					<div class="col-md-4">

						<!-- header-left start -->
						<!-- ================ -->
						<div class="header-left clearfix">

							<!-- logo -->
							<div class="logo smooth-scroll">
								<a href="#banner"><img id="logo" src="images/logo.png" alt="JJTale"></a>
							</div>

							<!-- name-and-slogan -->
							<div class="site-name-and-slogan smooth-scroll">
								<div class="site-name"><a href="#banner">JJTale</a></div>
								<!--<div class="site-slogan">sc.chinaz.com</div>-->
							</div>

						</div>
						<!-- header-left end -->

					</div>
					<div class="col-md-8">

						<!-- header-right start -->
						<!-- ================ -->
						<div class="header-right clearfix">

							<!-- main-navigation start -->
							<!-- ================ -->
							<div class="main-navigation animated">

								<!-- navbar start -->
								<!-- ================ -->
								<nav class="navbar navbar-default" role="navigation">
									<div class="container-fluid">

										<!-- Toggle get grouped for better mobile display -->
										<div class="navbar-header">
											<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
												<span class="sr-only">Toggle navigation</span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
												<span class="icon-bar"></span>
											</button>
										</div>

										<!-- Collect the nav links, forms, and other content for toggling -->
										<div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
											<ul class="nav navbar-nav navbar-right">
												<li class="active"><a href="Default.aspx">首页</a></li>
												<li><a href="#about">关于</a></li>
												<li><a href="#services">消息</a></li>
												<li><a href="#portfolio">观看记录</a></li>
												<li><a href="#clients">Clients</a></li>
											</ul>
										</div>

									</div>
								</nav>
								<!-- navbar end -->

							</div>
							<!-- main-navigation end -->

						</div>
						<!-- header-right end -->

					</div>
				</div>
			</div>
		</header>
    <!-- banner start -->
		<!-- ================ -->
		<div id="banner" class="banner">
			<div class="banner2-image"></div>
			<div class="banner2-caption">
				<div class="container" >
						<div class="col-md-8 col-md-offset-2 object-non-visible" data-animation-effect="fadeIn" >
							<!-- .footer start -->
					<h1 class="title text-center" id="contact">传说录入</h1>
                            <div class="col-md-3"> </div>
						<div class="col-sm-12" style="border-style:solid;border-width:1px;border-radius:3px 4px;border-color:darkgrey;">
							<div class="footer-content" style="margin:20px 0px 30px 0px">
								<form  role="form" method="post" id="footer_form" runat="server" >
                                    <div></div>
                                    <div class="pic_image"><asp:Image ID="pic" runat="server" /></div>
                                    <div><asp:FileUpLoad ID="pic_upload" runat="server" /><asp:Label ID="lbl_pic" runat="server" class="pic_text"></asp:Label></div>
                                    <div class="pic_label">上传图片格式为.jpg, .gif, .bmp,.png,图片大小不得超过8M</div>
									<div class="form-group has-feedback">
										<label class="sr-only" for="name2">Name</label>
										<input type="text" class="form-control" id="name2" placeholder="标题" name="name2" runat="server" required>
										<i class="fa fa-pencil form-control-feedback"></i>
									</div>
                                    <div class="form-group">
										<label class="sr-only" for="mainBody">mainBody</label>
										<TextArea class="form-control" id="mainBody" placeholder="正文" name="mainBody" runat="server" required aria-multiline="True" style="margin-top: 0px; margin-bottom: 0px; height: 175px;"/>
										
									</div>
                                    <div>
                                       <%-- <asp:Button Text="登录" ID="btn_Login" class="btn btn-default"  OnClick="Btn_LoginOnClicked" runat="server"/>--%>
                                        <asp:Button onclick="btn_Entry_Click" type="button" Text="录入" id="btn_Entry" class="btn btn-default" runat="server"/>                             
                                        <a href="Default.aspx">返回.</a>
                                    </div>
								</form>
							</div>
				        </div>
                               
			<!-- .footer end -->
						</div>
					</div>
			</div>
		</div>
		<!-- banner end -->
    
    <!-- Initialization of Plugins -->
		<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script type="text/javascript" src="plugins/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

		<!-- Modernizr javascript -->
		<script type="text/javascript" src="plugins/modernizr.js"></script>

		<!-- Isotope javascript -->
		<script type="text/javascript" src="plugins/isotope/isotope.pkgd.min.js"></script>
		
		<!-- Backstretch javascript -->
		<script type="text/javascript" src="plugins/jquery.backstretch.min.js"></script>

		<!-- Appear javascript -->
		<script type="text/javascript" src="plugins/jquery.appear.js"></script>

		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="js/template.js"></script>

		<!-- Custom Scripts -->
		<script type="text/javascript" src="js/custom.js"></script>
</body>
</html>
