<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="frm_dprgcol.aspx.cs" Inherits="frm_dprgcol" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            tabla = 'dprgcol';
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
        </div>
        <!-- Modal ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
        <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;</button>
                        <h4 class="modal-title text-info" id="idmodal">Definir Columnas</h4>
                    </div>
                    <!-- CUERPO ///////////////////////////////////////////// -->
                    <div class="modal-body">
                        <div class="col-lg-12 col-md-12 col-sx-12 col-sm-12" style="height: 295px">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="prgprg_nombre">Programa</label>
                                                <input type="text" id="prgprgnombre" data-esp="Nombre del Programa_G_C_K_R" class="text-240">
                                            </div>
                                            <div class="form-group">
                                                <label for="prgcol_nombre">Columna</label>
                                                <input type="text" id="prgcolnombre" data-esp="Nombre de la columna_R_G" class="text-240">
                                            </div>
                                            <div class="form-group">
                                                <label for="prgcol_caption">Título</label>
                                                <input id="prgcolcaption" data-esp="Código de la Ciudad_R_G" class="text-240">
                                            </div>
                                            <div class="form-group">
                                                <label for="prgcolformatstring">Formato</label>
                                                <input id="prgcolformatstring" data-esp="Formato_G" class="text-240">
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group" id="dvEstado">
                                                <label for="Admstscodigo">Estado</label>
                                                <select id="Admstscodigo" data-esp="Estado_R_G" class="select-240">
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="prgcolheaderalign">Headeralign</label>
                                                <input id="prgcolheaderalign" data-esp=" Headeralign_G_N_R" class="text-240">
                                            </div>
                                            <div class="form-group">
                                                <label for="prgcoltextalign">Textalign</label>
                                                <input id="prgcoltextalign" data-esp="Textalign_G_N_R" class="text-240">
                                            </div>
                                            <div class="form-group">
                                                <label for="prgcolvisible">Visible</label>
                                                <input id="prgcolvisible" data-esp="Visible_R_G" class="text-240">
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
