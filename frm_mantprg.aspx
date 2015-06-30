﻿<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="frm_mantprg.aspx.cs" Inherits="frm_mantprg" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            tabla = 'mprgtip';
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
                <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;</button>
                            <h4 class="modal-title text-info" id="idmodal">Definir Tipos de Programas</h4>
                        </div>
                        <!-- CUERPO ///////////////////////////////////////////// -->
                        <div class="modal-body">
                           <div class="col-lg-12 col-md-12 col-sx-12 col-sm-12" style="height: 165px">
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="PrgtipCodigo">Código del Programa</label>
                                                    <input type="text" id="PrgtipCodigo" data-esp="Código del Programa_C_G_K"
                                                        class="text-240" disabled="disabled">
                                                </div>
                                                <div class="form-group">
                                                    <label for="PrgtipNombre">Nombre del Programa</label>
                                                    <input type="text" id="PrgtipNombre" data-esp="Nombre del Programa_R_G" class="text-240">
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group" id="dvEstado">
                                                    <label for="AdmstsCodigo">Estado
                                                    </label>
                                                    <select id="AdmstsCodigo" data-esp="Estado_R_G" class="select-240">
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="PrgtipOrden">Orden del Programa</label>
                                                    <input type="text" id="PrgtipOrden" data-esp="Orden del Programa_N_R_G" class="text-240">
                                                </div>
                                            </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="btnGuardarModal" type="button" class="btn btn-primary" data-dismiss="modal">
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

