<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="frm_manmod.aspx.cs" Inherits="frm_manmod" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            tabla = 'mAdmMod';
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
            <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;</button>
                            <h4 class="modal-title text-info" id="idmodal">Definir Modulos del Sistema</h4>
                        </div>
                        <!-- CUERPO ///////////////////////////////////////////// -->
                        <div class="modal-body">
                            <div class="col-lg-12 col-md-12 col-sx-12 col-sm-12" style="height: 285px;">
                                        <div class="col col-3col">
                                                <div class="form-group">
                                                    <label for="camara_inicial">Código Sis.</label>
                                                    <input type="text" id="AdmmodCodigo" data-esp="Código del Modulo de Sistema_N_C_G_I_K" disabled readonly="readonly" class="text-240"/>
                                                </div>   
                                                <div class="form-group">
                                                    <label for="">Bloque</label>
                                                     <select class="select-240">
                                                        <option></option> 
                                                        <option>Bloque 1</option>
                                                        <option>Bloque 2</option>
                                                        <option>Bloque 3</option>
                                                     </select>
                                                </div> 
                                                <div class="form-group">
                                                    <label for="">Color de Fondo</label>
                                                    <select class="select-240 item_color7">
                                                        <option></option>
                                                        <option class="item_color7">item_color7</option>
                                                        <option>item_color2</option>
                                                        <option>item_color17</option>
                                                        <option>item_color9</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">    
                                                    <label for="camara_inicial">Orden</label>
                                                    <input type="text" class="text-240" id="AdmmodOrden" data-esp="Número de Orden_N_R_G"/>
                                                </div>
                                        </div>
                                        <div class="col col-3col">
                                                <div class="form-group">
                                                    <label for="">Nombre</label>
                                                    <input type="text" class="text-240" id="AdmmodNombre" data-esp="Nombre del Modulo del Sistema_R_G"/>
                                                </div> 
                                                 <div class="form-group">   
                                                    <label for="">Icono</label>
                                                    <select class="select-240" id="AdmmodIcono" data-esp="Icono del Modulo del Sistema_R_G">
                                                        <option></option> 
                                                        <option><img src="images/ic_agenda.png">ic_agenda.png</option>
                                                        <option>ic_consultas.ico</option>
                                                        <option>ic_mantenimientos.png</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">    
                                                    <label for="camara_inicial">Tamaño</label>
                                                    <select class="select-240">
                                                        <option></option> 
                                                        <option>item2x2</option>
                                                        <option>item4x2</option>
                                                        <option>item1x4</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col col-3col">
                                                <div class="btn-group" id="dvEstado">
                                                    <label for="AdmstsCodigo">Estado</label>
                                                    <select id="AdmstsCodigo" data-esp="Estado_R_G" class="select-240">
                                                    </select>
                                                </div>
                                                 <div class="form-group">
                                                    <label for="camara_inicial">Descripción</label>
                                                    <textarea class="area240-2row" placeholder="Escriba una descripción" style="width: 240px !important"></textarea>
                                                </div>
                                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="btnGuardarModal" type="button" class="btn btn-primary">
                                <i class="fa fa-save"></i> Guardar</button>
                            <button id="btnGuardarLimpiarModal" type="button" class="btn btn-info">
                                <i class="fa fa-save"></i> Guardar / Nuevo</button>
                            <button id="btnCerrarModal" type="button" class="btn btn-danger" data-dismiss="modal">
                                <i class="fa fa-times"></i> Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Final modal //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
        </div>
    </div>
</asp:Content>
