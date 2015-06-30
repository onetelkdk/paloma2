<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="frm_manppol.aspx.cs" Inherits="frm_manppol" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        $(document).ready(function () {
            tabla = 'mAdmPpl';
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
                            <h4 class="modal-title text-info" id="idmodal">Definir Partido Politico</h4>
                        </div>
                        <!-- CUERPO ///////////////////////////////////////////// -->
                        <div class="modal-body">
                           <div class="col-lg-12 col-md-12 col-sx-12 col-sm-12" style="height: 300px">
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="AdmPplCodigo">Código SIS</label>
                                                    <input type="text" id="AdmPplCodigo" data-esp="Código del Partido Político_N_C_G_I_K"
                                                        readonly="readonly" disabled class="text-240">
                                                </div>
                                                <div class="form-group">
                                                    <label for="AdmPplDescripcion">Descripción</label>
                                                    <textarea class="area240-2row" id="AdmPplDescripcion" data-esp="Descripción Partido Político_R_G" class="text-240" style="max-height: 178px !important;height: 178px !important"></textarea>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group" id="dvEstado" style="display: block !important">
                                                    <label for="AdmStsCodigo">Estado</label>
                                                    <select id="AdmStsCodigo" data-esp="Estado_R_G" class="select-240">
                                                    </select>
                                                </div>
                                                <fieldset>
                                                    <legend>Logotipo</legend>
                                                    <div align="center">
                                                        <img src="images/logotipo-inst.png">
                                                        <div style="clear: both"></div>
                                                        <button type="file" class="adjuntar-default">Adjuntar</button>
                                                    </div>
                                                </fieldset>
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
