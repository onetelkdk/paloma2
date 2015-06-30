<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="frm_manciu.aspx.cs" Inherits="frm_manciu" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            tabla = 'mAdmCiu';
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
                consultaBuscaId();
                

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
                        <button type="button" class="btn btn-nuevo ic_mas" data-toggle="modal">Nuevo</button>
                        <button type="button" class="btn btn-editar ic_lapiz">Editar</button>
                        <button type="button" class="btn btn-visualizar ic_monitor">Visualizar</button>
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
                            <h4 class="modal-title text-info" id="idmodal">
                                Definir Ciudades</h4>
                        </div>
                        <!-- CUERPO ///////////////////////////////////////////// -->
                        <div class="modal-body">
                            <div class="col-lg12 col-md12 col-sm-12 col-xs-12">
                                <div class="col col-3col">
                                     <div class="form-group" style="display:none">
                                          <label for="AdmciuCodigo">Código SIS</label>
                                          <input type="text" id="AdmciuCodigo" data-esp="Código de la Ciudad_C_G_I_K" disabled="disabled" readonly="readonly" class="text-default">
                                     </div>
                                    <div class="form-group">
                                      <label for="AdmciuCiudad">Nombre</label>
                                      <input type="text" id="AdmciuCiudad" data-esp="Nombre de la Ciudad_R_G" class="text-240" data-toggle="tooltip" data-placement="top" title="Escriba el nombre de la ciudad aquí">
                                 </div>
                                 <div class="form-group">
                                      <label for="AdmprvCodigo">
                                       Provincia</label>
                                      <select id="AdmprvCodigo" data-esp="Código de la Provincia_N_R_G" class="select-240" data-toggle="tooltip" data-placement="top" title="Seleccione la provincia correspondiente a la ciudad">
                                      </select>
                                 </div>
                                 </div>
                                <div class="col">
                                    <div class="form-group" id="dvEstado" disabled="disabled">
                                         <label for="Admstscodigo">Estado</label>
                                         <select disabled id="Admstscodigo" data-esp="Estado_R_G" class="select-default" ></select>
                                     </div>
                                    <img src="images/buildings8.svg" class="img-mnt"/>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="btnGuardarModal" type="button" class="btn btn-primary">
                                <i class="fa fa-save mr5"></i>Guardar</button>
                            <button id="btnGuardarLimpiarModal" type="button" class="btn btn-info">
                                <i class="fa fa-save mr5"></i>Guardar / Nuevo</button>
                            <button id="btnCerrarModal" type="button" class="btn btn-danger" data-dismiss="modal">
                                <i class="fa fa-times mr5"></i>Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Final modal //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
        </div>
    </div>
</asp:Content>
