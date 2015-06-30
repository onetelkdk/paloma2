<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="frm_manleg.aspx.cs" Inherits="frm_manleg" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            tabla = 'mAdmIns';
            llenaComboit(tabla);
            consultaPrincipal(tabla);
            modo = 1;

            $('.ic_mas').click(function () {
                $('#dvEstado').hide();
                $("#modal1").modal("show");
                $('#btnGuardarModal').show();
                $('#btnGuardarLimpiarModal').show();


            });

            $('.ic_lapiz').click(function () {
                $('#dvEstado').show();
                $('#btnGuardarModal').show();
                $('#btnGuardarLimpiarModal').show();


            });

            $('.ic_monitor').click(function () {
                $('#dvEstado').show();
                $("#modal1").modal;
                $('#btnGuardarModal').hide();
                $('#btnGuardarLimpiarModal').hide();

            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="data">
        <div class="data_body">
            <div class="row">
                <div class="col-lg-12">
                    <div class="botones_nev">
                        <button type="button" class="btn btn-nuevo ic_mas" data-toggle="modal">
                            Nuevo</button>
                        <button type="button" class="btn btn-editar ic_lapiz">
                            Editar</button>
                        <button type="button" class="btn btn-visualizar ic_monitor">
                            Visualizar</button>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="table-responsive" id="dvPrincipal">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
            <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                aria-hidden="true" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;</button>
                            <h4 class="modal-title text-info" id="idmodal">Definir Legisladores</h4>
                        </div>
                        <!-- CUERPO ///////////////////////////////////////////// -->
                        <div class="modal-body">
                            <div class="col-lg-12 col-md-12 col-sx-12 col-sm-12">
                                <ul id="myTab" class="nav nav-tabs">
                                    <li class="active"><a href="#datos_personales" data-toggle="tab" data-original-title=""
                                        title="">Datos Personales</a> </li>
                                    </li>
                                    <li><a href="#contacto" data-toggle="tab" data-original-title="" title="">Contacto</a>
                                    </li>
                                    <li><a href="#comisiones" data-toggle="tab" data-original-title="" title="">Comisiones</a>
                                    </li>
                                    <li><a href="#bloque_partidario" data-toggle="tab" data-original-title="" title="">Bloque
                                        Partidario</a> </li>
                                    <li><a href="#excusas" data-toggle="tab" data-original-title="" title="">Excusas</a>
                                    </li>
                                    <li><a href="#iniciativas" data-toggle="tab" data-original-title="" title="">Iniciativas</a>
                                    </li>
                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade in active" id="datos_personales">
                                        <div class="body-data-tabs" style="height: 290px">
                                            <!-- TAB-->
                                            <div class="col col-4col">

                                                <label for="identificacion">
                                                    Tipo de Identificacion</label>
                                                <select name="identificacion" id="" class="select-default">
                                                    <option value="seleccion"></option>
                                                    <option value="cedula">Cedula</option>
                                                    <option value="rnc">R.N.C</option>
                                                    <option value="pasaporte">Pasaporte</option>
                                                </select>

                                                <label for="nombre">
                                                    Nombres</label>
                                                <input type="text" id="AdmlegNombres" data-esp="Nombres_G_R" class="text-default">

                                                <label for="apellido">
                                                    Primer Apellido</label>
                                                <input type="text" id="AdmlegApellido1" data-esp="Primer Apellido_G_R" class="text-default">

                                                <label for="fechaNac">
                                                    Fecha de Nacimiento</label>
                                                <input type="text" id="AdmlegFechaNac" data-esp="Fecha de Nacimiento_G_R_F" class="text-default">
                                            </div>
                                            <div class="col col-4col">
                                                <div class="form-group">
                                                    <label for="noidentificacion">
                                                    Número de Identificación</label>
                                                    <input type="text" id="AdmlegCedula" data-esp="Número de Identificación_G_R_N_C_K"
                                                    class="text-default">
                                                </div>
                                                <div class="form-group">
                                                    <label for="apellido2">
                                                    Segundo Apellido</label>
                                                    <input type="text" id="AdmlegApellido2" data-esp="Segundo Apellido_G_R" class="text-default">
                                                </div>
                                                <div class="form-group">
                                                    <label for="noidentificacion">
                                                    Partido Político</label>
                                                    <select name="partidopol" id="" class="select-default">
                                                    <option></option>
                                                    <option>PLD</option>
                                                    <option >PRD</option>
                                                    <option>PRM</option>
                                                    <option>PRSC</option>
                                                    <option>MODA</option>
                                                </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="apellido2">
                                                    Posición (Bloque Partidario)</label>
                                                    <select name="partidopol" id="" class="select-default">
                                                    <option></option>
                                                    <option>Presidente</option>
                                                    <option >Secretario</option>
                                                    <option>Vocal</option>
                                                    </select>
                                                </div>    
                                            </div>
                                            <div class="col col-4col">

                                                <label for="huella">
                                                    Huella</label>
                                                <div class="img-lgs">
                                                    <img src="images/img_huella.png" alt="">
                                                </div>
                                                <button type="button" class="btn-huella">
                                                    Tomar huella</button>
                                            </div>
                                            <div class="col col-4col">

                                                <label for="fotoperfil">
                                                    Foto de Perfíl</label>
                                                <div class="img-lgs">
                                                    <img src="images/foto_perfil_legislador.png" alt="" class="fperfil">
                                                </div>
                                                <button type="file" class="btn-fotoperfil">
                                                    Subir foto de perfil</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="contacto" style="height: 270px">

                                        <!-- TAB-->
                                        <div class="col col-3col">

                                            <label for="territorio ">
                                                Dirección</label>
                                            <input type="text" class="text-240 ic_home">

                                            <label for="sector">
                                                Sector</label>
                                            <select name="municipio" id="" class="select-240">
                                                <option value="seleccion"></option>
                                                <option value="cedula">Pueblo Nuevo</option>
                                                <option value="rnc">Centro de la Ciudad</option>
                                                <option value="pasaporte">Los Melones</option>
                                            </select>

                                            <label for="fax">
                                                Fax</label>
                                            <input type="text" class="text-240 ic_fax">

                                            <label for="sitioweb">
                                                Facebook</label>
                                            <input type="text" class="text-240 ic_facebook" placeholder="nombre o e-mail">
                                        </div>
                                        <div class="col col-3col">

                                            <label for="territorio ">
                                                Municipio</label>
                                            <select name="municipio" id="" class="select-240">
                                                <option value="seleccion"></option>
                                                <option value="cedula">Baní</option>
                                                <option value="rnc">Azua</option>
                                                <option value="pasaporte">Barahona</option>
                                            </select>

                                            <label for="territorio ">
                                                Teléfono celular</label>
                                            <input type="text" class="text-240 ic_iphone">

                                            <label for="sitioweb">
                                                E-mail</label>
                                            <input type="text" class="text-240 ic_email">

                                            <label for="sitioweb">
                                                Twitter</label>
                                            <input type="text" class="text-240 ic_twitter" placeholder="@su_usuario">
                                        </div>
                                        <div class="col col-3col">

                                            <label for="provincia">
                                                Provincia</label>
                                            <select name="municipio" id="" class="select-240">
                                                <option value="seleccion"></option>
                                                <option value="cedula">Peravia</option>
                                                <option value="rnc">San Juan</option>
                                                <option value="pasaporte">Hato Mayor</option>
                                            </select>

                                            <label for="provincia">
                                                Teléfono oficina senatorial</label>
                                            <input type="text" class="text-240 ic_tel1">

                                            <label for="sitioweb">
                                                Sitio Web</label>
                                            <input type="text" class="text-240 ic_iexplorer" placeholder="www.susitioweb.com">

                                            <label for="sitioweb">
                                                Linkedin</label>
                                            <input type="text" class="text-240 ic_linkedin">
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="comisiones" style="height: auto">

                                        <!-- TAB-->
                                        <div class="col">

                                            <label for="provincia">
                                                No. de orden</label>
                                            <input type="text" class="text-default">
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Descripción</label>
                                            <input type="text" class="text-default">
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Objetivo</label>
                                            <select name="municipio" id="" class="select-default">
                                                <option value="seleccion"></option>
                                                <option value="cedula">Objetivo 1</option>
                                                <option value="rnc">Objetivo 2</option>
                                                <option value="pasaporte">Objetivo 3</option>
                                            </select>
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Cargo</label>
                                            <input type="text" class="text-default">
                                        </div>
                                        <div style="clear: both; margin: 0 0 20px 0">
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <div class="table-responsive">
                                                    <table class="table table-striped table-bordered table-hover" id="dtt-comisiones">
                                                        <thead>
                                                            <tr class="table_heading">
                                                                <th></th>
                                                                <th>No. Orden
                                                                </th>
                                                                <th>Descripción
                                                                </th>
                                                                <th>Objetivo
                                                                </th>
                                                                <th>Cargo
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>1204
                                                                </td>
                                                                <td>Descripción aqui
                                                                </td>
                                                                <td>809-548-5478
                                                                </td>
                                                                <td>Cargo
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>6532
                                                                </td>
                                                                <td>Descripción aqui 3
                                                                </td>
                                                                <td>809-548-6666
                                                                </td>
                                                                <td>Cargo
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>12014
                                                                </td>
                                                                <td>Descripción aqui
                                                                </td>
                                                                <td>809-548-4758
                                                                </td>
                                                                <td>Cargo
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>8745
                                                                </td>
                                                                <td>Descripción aqui
                                                                </td>
                                                                <td>809-548-9663
                                                                </td>
                                                                <td>Cargo
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>8746
                                                                </td>
                                                                <td>Descripción aqui
                                                                </td>
                                                                <td>809-548-9874
                                                                </td>
                                                                <td>Cargo
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="bloque_partidario">

                                        <!-- TAB-->
                                        <div class="col">

                                            <label for="provincia">
                                                Organización</label>
                                            <select name="municipio" class="select-default">
                                                <option value="seleccion"></option>
                                                <option value="cedula">Opción 1</option>
                                                <option value="rnc">Opción 2</option>
                                                <option value="pasaporte">Opción 3</option>
                                            </select>
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Siglas</label>
                                            <select name="municipio" class="select-140">
                                                <option value="seleccion"></option>
                                                <option value="cedula">Opción 1</option>
                                                <option value="rnc">Opción 2</option>
                                                <option value="pasaporte">Opción 3</option>
                                            </select>
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Fecha Inicio</label>
                                            <input type="text" class="text-140">
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Fecha Final</label>
                                            <input type="text" class="text-140">
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Titulo</label>
                                            <input type="text" class="text-140">
                                        </div>
                                        <div style="clear: both; margin: 0 0 20px 0">
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <div class="table-responsive">
                                                    <table class="table table-striped table-bordered table-hover" id="dtt-blqpartidario">
                                                        <thead>
                                                            <tr class="table_heading">
                                                                <th></th>
                                                                <th>Organización
                                                                </th>
                                                                <th>Siglas
                                                                </th>
                                                                <th>Fecha Inicio
                                                                </th>
                                                                <th>Fecha Final
                                                                </th>
                                                                <th>Titulo
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>Organización 1
                                                                </td>
                                                                <td>ONG
                                                                </td>
                                                                <td>20/05/2015
                                                                </td>
                                                                <td>05/07/2016
                                                                </td>
                                                                <td>Titulo
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>Organización Principal
                                                                </td>
                                                                <td>OP
                                                                </td>
                                                                <td>01/02/2014
                                                                </td>
                                                                <td>12/05/2015
                                                                </td>
                                                                <td>Titulo
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>La mas Dura
                                                                </td>
                                                                <td>LMD
                                                                </td>
                                                                <td>03/07/2016
                                                                </td>
                                                                <td>09/22/2020
                                                                </td>
                                                                <td>Titulo
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>Organizativa
                                                                </td>
                                                                <td>OEZV
                                                                </td>
                                                                <td>03/21/2030
                                                                </td>
                                                                <td>03/05/2014
                                                                </td>
                                                                <td>Titulo
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>Ultima Org
                                                                </td>
                                                                <td>URG
                                                                </td>
                                                                <td>05/23/2016
                                                                </td>
                                                                <td>02/03/2014
                                                                </td>
                                                                <td>Titulo
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="excusas">

                                        <!-- TAB-->
                                        <div class="col">

                                            <label for="provincia">
                                                Fecha</label>
                                            <input type="text" class="text-150">
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Tipo de Excusa</label>
                                            <input type="text" class="text-150">
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Justificación</label>
                                            <input type="text" class="text-150">
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Notificar a</label>
                                            <input type="text" class="text-150">
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Faltar en la</label>
                                            <input type="text" class="text-150">
                                        </div>
                                        <div style="clear: both; margin: 0 0 20px 0">
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <div class="table-responsive">
                                                    <table class="table table-striped table-bordered table-hover" id="dtt-excusas">
                                                        <thead>
                                                            <tr class="table_heading">
                                                                <th></th>
                                                                <th>Fecha
                                                                </th>
                                                                <th>Tipo Excusa
                                                                </th>
                                                                <th>Justificación
                                                                </th>
                                                                <th>Notificar a
                                                                </th>
                                                                <th>Faltar en la
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>22/02/2011
                                                                </td>
                                                                <td>Nivel 1
                                                                </td>
                                                                <td>No pude asistir por la perdida de un familiar
                                                                </td>
                                                                <td>Kerlin Garcia
                                                                </td>
                                                                <td>Unica que iba a asistir
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>01/10/2015
                                                                </td>
                                                                <td>Nivel 2
                                                                </td>
                                                                <td>No pude asistir por la perdida de un familiar
                                                                </td>
                                                                <td>Hector Lara
                                                                </td>
                                                                <td>que nunca he ido
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>01/02/2014
                                                                </td>
                                                                <td>Nivel 10
                                                                </td>
                                                                <td>No pude asistir por la perdida de un familiar
                                                                </td>
                                                                <td>Yohanna de León
                                                                </td>
                                                                <td>Unica que iba a asistir
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="iniciativas">

                                        <!-- TAB-->
                                        <div class="col">
                                            <label for="provincia">
                                                Fecha</label>
                                            <input type="text" class="text-140">
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Tipo de Iniciativa</label>
                                            <select name="municipio" class="select-default">
                                                <option value="seleccion"></option>
                                                <option value="cedula">Opción 1</option>
                                                <option value="rnc">Opción 2</option>
                                                <option value="pasaporte">Opción 3</option>
                                            </select>
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Descripción</label>
                                            <input type="text" class="text-210">
                                        </div>
                                        <div class="col">

                                            <label for="provincia">
                                                Estado</label>
                                            <select name="municipio" class="select-default">
                                                <option value="seleccion"></option>
                                                <option value="cedula">Opción 1</option>
                                                <option value="rnc">Opción 2</option>
                                                <option value="pasaporte">Opción 3</option>
                                            </select>
                                        </div>
                                        <div style="clear: both; margin: 0 0 20px 0">
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <div class="table-responsive">
                                                    <table class="table table-striped table-bordered table-hover" id="dtt-blqpartidario">
                                                        <thead>
                                                            <tr class="table_heading">
                                                                <th></th>
                                                                <th>Fecha
                                                                </th>
                                                                <th>Tipo Iniciativa
                                                                </th>
                                                                <th>Descripción
                                                                </th>
                                                                <th>Estado
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>20/05/2015
                                                                </td>
                                                                <td>ONG
                                                                </td>
                                                                <td>Algo que describa aqui
                                                                </td>
                                                                <td>En curso
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>20/05/2015
                                                                </td>
                                                                <td>ONG
                                                                </td>
                                                                <td>Algo que describa aqui
                                                                </td>
                                                                <td>En curso
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox">
                                                                </td>
                                                                <td>20/05/2015
                                                                </td>
                                                                <td>ONG
                                                                </td>
                                                                <td>Algo que describa aqui
                                                                </td>
                                                                <td>En curso
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary">
                                <i class="fa fa-save"></i> Guardar</button>
                            <button type="button" class="btn btn-info">
                                <i class="fa fa-save"></i> Guardar / Nuevo</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">
                                <i class="fa fa-times"></i> Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Final modal //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
        </div>
    </div>
</asp:Content>
