<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Clients.aspx.cs" Inherits="Clients" %>

<!DOCTYPE html>

<html >
<head runat="server">
    
    <title>JJTale Clients</title>
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
<body class="no-trans" >
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
							<h1 class="title text-center" id="contact">用户信息</h1>

                            <%--<div class="col-sm-12" style="border-style:solid;border-width:1px;border-radius:3px 4px;border-color:darkgrey;">--%>
							<div class="footer-content">
                                
								<form  role="form" method="post" id="footer_form" runat="server" >
                                    <p><asp:TextBox runat="server" ID="text_search" ForeColor="Black" Width="192px" ></asp:TextBox>
                                        <asp:Button Text="查询记录" ID="btn_search" runat="server" ForeColor="Black" CssClass="btn" OnClick="btn_search_Click"/>
                                        <asp:Button Text="显示全部记录" ID="btn_showAll" runat="server" ForeColor="Black" CssClass="btn" OnClick="btn_showAll_Click"/>
                                        </p>
                                    <asp:GridView ID="gridview_userInformation" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize="5" DataSourceID="SqlDataSource1" Width="876px" 
                                                    OnDataBound="gridview_userInformation_DataBound" DataKeyNames="id" CellPadding="4" ForeColor="#333333" GridLines="None" Height="150px" HorizontalAlign="Center">

                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" SortExpression="id" ReadOnly="true" />
                                            <asp:BoundField DataField="uname" HeaderText="用户名" SortExpression="uname" />
                                            <asp:BoundField DataField="passw" HeaderText="密码" SortExpression="passw" />
                                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                            <asp:BoundField DataField="userInformation" HeaderText="用户信息" SortExpression="userInformation" />
                                        </Columns>


                                        <EditRowStyle BackColor="#2461BF" />
                                        
                                        <EmptyDataTemplate>
                                            <div></div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only" for="name2">Name</label>
                                                <input type="text" class="form-control" id="name2" placeholder="用户名" name="name2" runat="server" >
                                                <i class="fa fa-user form-control-feedback"></i>
                                            </div>

                                            <div class="form-group has-feedback">
                                                <label class="sr-only" for="password">Password</label>
                                                <input type="password" class="form-control" id="password2" placeholder="请输入密码" name="password" runat="server" >
                                                <i class="fa fa-pencil form-control-feedback"></i>
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="sr-only" for="email2"></label>
                                                <input type="email" class="form-control" id="email2" placeholder="请输入邮箱" name="email" runat="server" >
                                                <i class="fa fa-envelope form-control-feedback"></i>
                                            </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="userInformation">userInformation</label>
                                                <textarea class="form-control" id="userInformation" placeholder="个人签名(可以为空)" name="userInformation" runat="server" />

                                            </div>
                                            <div>
                                                <%-- <asp:Button Text="登录" ID="btn_Login" class="btn btn-default"  OnClick="Btn_LoginOnClicked" runat="server"/>--%>
                                                <asp:Button OnClick="btn_newRecord_Click" Text="添加" ID="btn_newRecord" CssClass="btn btn-default" runat="server" />
                                                <asp:Button Text="取消" ID="btn_cancel" CssClass="btn" runat="server" OnClick="btn_cancel_Click" />
                                            </div>
                                        </EmptyDataTemplate>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />

                                    </asp:GridView>
                                    
                                    
								    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:jjtaleConnectionString %>" DeleteCommand="DELETE FROM user WHERE id = ?" InsertCommand="INSERT INTO user (id, uname, gender, passw, email, userInformation) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:jjtaleConnectionString.ProviderName %>" SelectCommand="SELECT * FROM user;" UpdateCommand="UPDATE user SET uname = ?, gender = ?, passw = ?,email = ?, userInformation = ? WHERE id = ?;">
                                        <DeleteParameters>
                                            <asp:Parameter Name="id" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="id" Type="Int32" />
                                            <asp:Parameter Name="uname" Type="String" />
                                            <asp:Parameter Name="gender" Type="String"/>
                                            <asp:Parameter Name="passw" Type="String" />
                                            <asp:Parameter Name="email" Type="String" />
                                            <asp:Parameter Name="userInformation" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="uname" Type="String" />
                                            <asp:Parameter Name="gender" Type="String"/>
                                            <asp:Parameter Name="passw" Type="String" />
                                            <asp:Parameter Name="email" Type="String" />
                                            <asp:Parameter Name="userInformation" Type="String" />
                                            <asp:Parameter Name="id" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:Button Text="新建记录" ID="btn_new" runat="server" ForeColor="Black" CssClass="btn" OnClick="btn_new_Click"/>
                                    
								</form>
							</div>
				        <%--</div>--%>
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
