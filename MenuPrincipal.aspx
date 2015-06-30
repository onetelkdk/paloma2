<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MenuPrincipal.aspx.cs" Inherits="MenuPrincipal" %>

<script src="js/jquery.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/maincod.js"></script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SIL</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/mainstyles.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link href="css/bootstrap.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
</head>

<body>

    <header>
        <div class="header_container">
            <div class="logo">
                <img src="images/logo_sil.png" width="475" alt="Senado de la Republica Dominicana">
            </div>
            <div id="usr-top">
                <div class="usrdiv">
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <div class="loged-user">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <span class="hidden-xs pl15">Hector Luis Lara <i class="fa fa-caret-down"></i></span>
                                    <img src="images/foto_perfil_legislador.png" alt="">
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#"><i class="fa fa-user fa-fw"></i>Perfil de usuario</a></li>
                                    <li><a href="#"><i class="fa fa-gear fa-fw"></i>Configuración</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#"><i class="fa fa-sign-out"></i>Salir</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <span class="notif-total">2</span>
                                <div class="notification">
                                    <i class="fa fa-bell-o"></i>
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-user email-list-ntfbody">
                                <li class="ulmail-header"><strong><small>Notificaciones (17)</small></strong>
                                </li>
                                <li class="divider"></li>
                                <li><strong>Katherine Montero</strong>
                                    <small style="float: right"><a href="#">kmontero@senado.gob.do</a></small>
                                    <div class="email-list-ntf-main">
                                        <p class="email-list-ntf">Buenos dias señor Santos le escribo para decrirle que la ...</p>
                                        <footer>10 de enero 2013</footer>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li align="center"><a href="#"><i class="fa fa-eye"></i>Ver todos</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div style="clear: both"></div>
        <div class="breadcrumb">
            <h4>MENU - Principal</h4>
        </div>
    </header>


    <div class="main_container">
        <div id="main_modulo">
            <div class="modulo_contenido full" id="modulo_contenido">
                 <div class="main_container">   
                    <div id="dvMenu" runat="server">

                    </div>
                  </div>
                </div>
            </div>
        </div>
    

  <!--
                  <div class="modulo_item item4x2 item_color5">
		            	<a href="menues_admin_seguridad.html">
		                    <div class="item_contenido">
		                        <div class="modulo_nombre" style="background: url('images/ic_administracion.png');">
		                            <span>Adminiiiiiistración y Seguridad</span>
                                    <span>Seguridad</span>
		                        </div>
		                    </div>
		                </a>    
		            </div>
	      		</div>
		           
 
	      		<div class="modulo_contenido medio">
	      			<div class="modulo_item item2x2 item_color2">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
		            <div class="modulo_item item2x2 item_color4">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
		            <div class="modulo_item item2x2 item_color7">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
		            <div class="modulo_item item2x2 item_color1">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
		            <div class="modulo_item item2x2 item_color8">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
		            <div class="modulo_item item2x2 item_color3">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
	      		</div>
	      		<div class="modulo_contenido medio">
	      			<div class="modulo_item item2x2 item_color9">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
		            <div class="modulo_item item2x2 item_color12">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
		            <div class="modulo_item item2x2 item_color13">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
		            <div class="modulo_item item2x2 item_color2">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
		            <div class="modulo_item item2x2 item_color3">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
		            <div class="modulo_item item2x2 item_color4">
		                <div class="item_contenido">
		                    <div class="modulo_nombre">
		                        <span>Modulo</span>
		                    </div>
		                </div>
		            </div>
	      		</div>
	    	</div>  
		</div>
            -->
</body>
</html>
