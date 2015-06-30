<%@ Page Title="abc" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="frm_manins.aspx.cs" Inherits="frm_manins" %>

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
                            <h4 class="modal-title text-info" id="idmodal">
                                Definir Instituciones</h4>
                        </div>
                        <!-- CUERPO ///////////////////////////////////////////// -->
                        <div class="modal-body">
                                        <div class="col-lg-12 col-md-12 col-sx-12 col-sm-12" style="height: 295px;">
                                            <div class="col col-4col">
                                                <fieldset>
                                                    <legend>Logotipo</legend>
                                                    <div align="center">
                                                        <img src="images/logotipo-inst.png">
                                                        <div style="clear: both"></div>
                                                        <button type="file" class="adjuntar-default">Adjuntar</button>
                                                    </div>
                                                </fieldset>
                                                <div class="form-group">
                                                    <label for="camara_inicial">Dirección</label>
                                                    <input type="text" class="text-default" />
                                                </div>    
                                            </div>

                                            <div class="col col-4col">
                                                <div class="form-group">
                                                    <label for="AdminsCodigo">Código SIS</label>
                                                    <input type="text" id="AdminsCodigo" data-esp="Código de la Institución_N_C_G_I_K"
                                                        readonly="readonly"  disabled class="text-default">
                                                </div>
                                                <div class="form-group">        
                                                    <label for="camara_inicial">Siglas</label>
                                                    <input type="text" class="text-default" />
                                                </div>
                                                <div class="form-group">    
                                                    <label for="no_documento_asociado">E-mail</label>
                                                    <input type="text" class="text-default" />
                                                </div>
                                                <div class="form-group">    
                                                    <label for="camara_inicial">Sitio Web</label>
                                                    <input type="url" class="text-default" />
                                                </div>    
                                            </div>
                                            <div class="col col-4col">
                                               <div class="btn-group">
                                                    <label for="AdminsDescripcion">Descripción</label>
                                                    <input type="text" id="AdminsDescripcion" data-esp="Descripción de la Institución_R_G"
                                                        class="text-default">
                                                </div>
                                                <div class="form-group">        
                                                    <label for="ano_legislativo">Tipo</label>
                                                    <select class="select-default">
                                                        <option selected=""></option> 
                                                        <option>Gubernamental</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">    
                                                    <label for="no_documento_asociado">Clasificador Institucional</label>
                                                    <select class="select-default">
                                                        <option selected=""></option> 
                                                        <option> 000001</option>
                                                        <option> 000002</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">        
                                                    <label for="camara_inicial">Fax</label>
                                                    <input type="text" class="text-default" />
                                                </div>    
                                            </div>
                                            <div class="col col-4col">
                                                <div class="form-group">
                                                    <label for="camara_inicial">R.N.C.</label>
                                                    <input type="text" class="text-default" />
                                                </div>
                                                <div class="form-group">            
                                                    <label for="ano_legislativo">Teléfono</label>
                                                    <input type="text" class="text-default" />
                                                </div>    
                                                <div class="form-group">        
                                                    <label for="no_documento_asociado">Teléfono Adicional</label>
                                                    <input type="text" class="text-default" />
                                                </div>
                                                <div class="form-group">    
                                                    <label for="camara_inicial">Slogan</label>
                                                    <input type="text" class="text-default" />
                                                </div>    
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
