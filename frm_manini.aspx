<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_manini.aspx.cs" Inherits="frm_manini" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            tabla = 'mIniIni';
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!--////////////////////////////////////////////////////////////////////////////////////////// -->
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

            <table class="table table-striped table-bordered table-hover" id="dataTables">
                <thead>
                    <tr class="table_heading">
                        <th></th>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Identificación</th>
                        <th>Telefono</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input type="checkbox"></td>
                        <td>1</td>
                        <td>Juan Manuel</td>
                        <td>Soto Perez</td>
                        <td>003-01259875-5</td>
                        <td>809-548-5478</td>
                        <td><span class="estado Activo">Activo</span></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox"></td>
                        <td>2</td>
                        <td>Hector Luis</td>
                        <td>Lara Zapara</td>
                        <td>003-017459875-3</td>
                        <td>809-548-6666</td>
                        <td><span class="estado Inactivo">Inactivo<</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- Modal ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
    <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title text-info" id="idmodal">Definir Iniciativas</h4>
                </div>
                <!-- CUERPO ///////////////////////////////////////////// -->
                <div class="modal-body">
                    <div class="col-lg-12 col-md-12 col-sx-12 col-sm-12">
                        <ul id="myTab" class="nav nav-tabs">
                            <li class="active">
                                <a href="#del_la_iniciativa" data-toggle="tab" data-original-title="" title="">De la iniciativa</a>
                            </li>
                            <li>
                                <a href="#datos_de_control" data-toggle="tab" data-original-title="" title="">Datos de control</a>
                            </li>
                            <li>
                                <a href="#contacto" data-toggle="tab" data-original-title="" title="">Control revisión y auditoría</a>
                            </li>
                            <li>
                                <a href="#envio-destino" data-toggle="tab" data-original-title="" title="">Flujo, envío y destino</a>
                            </li>
                            <li>
                                <a href="#estados_cambios" data-toggle="tab" data-original-title="" title="">Estados-cambios</a>
                            </li>


                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade in active" id="del_la_iniciativa">
                                <div class="body-data-tabs" style="height: 270px">
                                    <div class="col col-4col">
                                        <label for="codigo">Codigo SIS</label>
                                        <input type="text" class="text-default" />

                                        <label for="materia">Materia</label>
                                        <select class="select-default" id="" name="materia">
                                            <option selected></option>
                                            <option>Materia 1</option>
                                        </select>

                                        <label for="creado">Creado por</label>
                                        <select class="select-default" id="" name="creado">
                                            <option selected></option>
                                            <option>Usuario 1</option>
                                        </select>

                                        <label for="anotaciones">Anotaciones especiales</label>
                                        <input type="text" class="text-default" />
                                    </div>
                                    <div class="col col-4col">
                                        <label for="nodocumento">No. Documento</label>
                                        <input type="text" class="text-default" />

                                        <label for="fecha_recepcion">Fecha de recepción</label>
                                        <input type="text" id="maninifrecepcion" class="text-default fecha-default"/>

                                        <label for="observacion">Observación o referencia</label>
                                        <input type="text" class="text-default" />

                                        <label for="digitado">Digitado por</label>
                                        <select class="select-default" id="" name="creado">
                                            <option selected></option>
                                            <option>Usuario 1</option>
                                        </select>

                                    </div>
                                    <div class="col col-4col">

                                        <label for="tipo_iniciativa">Tipo de iniciativa</label>
                                        <select class="select-default" id="" name="tipo de iniciativa">
                                            <option selected></option>
                                            <option>Iniciativa 1</option>
                                        </select>
                                    </div>

                                    <div style="padding-top: 1px;">
                                        <label for="subtipo_iniciativa">Sub-tipo de iniciativa</label>
                                        <select class="select-default" id="" name="tipo de iniciativa">
                                            <option selected></option>
                                            <option>Sub-tipo Iniciativa 1</option>
                                        </select>
                                    </div>
                                    <div class="col col-2col">
                                        <label for="descripcion">Descripción</label>
                                        <textarea class="textarea-2col" cols="47" placeholder="Escriba una descripción aquí"></textarea>
                                    </div>
                                </div>


                            </div>
                            <div class="tab-pane fade" id="datos_de_control">
                                <div style="height: 205px">
                                    <div class="col col-4col">
                                        <label for="camara_inicial">Cámara inicial</label>
                                        <select class="select-default">
                                            <option selected=""></option>
                                            <option>Inicio de cámara</option>
                                        </select>

                                        <label for="ano_legislativo">Año legislativo</label>
                                        <select class="select-default">
                                            <option selected=""></option>
                                            <option>2015</option>
                                        </select>

                                        <label for="no_documento_asociado">No. de documento asociado</label>
                                        <select class="select-default">
                                            <option selected=""></option>
                                            <option>000001</option>
                                            <option>000002</option>
                                        </select>
                                    </div>
                                    <div class="col col-4col">
                                        <label for="cant_devueltas">Cantidad de veces devuelta</label>
                                        <input type="text" class="text-default" />

                                        <label for="proponente">Proponente</label>
                                        <input type="text" class="text-default" />

                                        <label for="camara_origen">Cámara de origen</label>
                                        <select class="select-default">
                                            <option selected=""></option>
                                            <option>000001</option>
                                            <option>000002</option>
                                        </select>
                                    </div>
                                    <div class="col col-4col">
                                        <label for="camara">Cámara</label>
                                        <select class="select-default">
                                            <option selected=""></option>
                                            <option>000001</option>
                                            <option>000002</option>
                                        </select>

                                        <label for="legislatura">Legislatura</label>
                                        <select class="select-default">
                                            <option selected=""></option>
                                            <option>000001</option>
                                            <option>000002</option>
                                        </select>
                                    </div>
                                    <div class="col col-4col">
                                        <label for="cant_legislativa">Cantidad legislativa</label>
                                        <select class="select-default">
                                            <option selected=""></option>
                                            <option>000001</option>
                                            <option>000002</option>
                                        </select>

                                        <label for="periodo_constitucional">Periodo consstitucional</label>
                                        <select class="select-default">
                                            <option selected=""></option>
                                            <option>2010-2016</option>
                                            <option>2016-2020</option>
                                        </select>
                                    </div>


                                </div>
                            </div>
                            <div class="tab-pane fade" id="contacto">
                                <div style="height: 215px">
                                    <div class="col col-4col">
                                        <div class="font-default sn">
                                            Iniciativa: Si:
                                                        <input type="checkbox" />&nbsp;&nbsp; No:
                                                        <input type="checkbox" />
                                        </div>
                                        <label for="analisis" style="margin-top: 29px !important;">
                                            <br>
                                            <br>
                                            Analisis legislativo</label>
                                        <select class="select-default">
                                            <option selected="select"></option>
                                            <option>Ejemplo 1</option>
                                        </select>
                                        <label for="analista">Analista</label>
                                        <select class="select-default">
                                            <option selected="select"></option>
                                            <option>Ejemplo 1</option>
                                        </select>
                                    </div>
                                    <div class="col col-4col">
                                        <label for="correcion_estilos" style="padding-top: 47px">Corrección de estilos</label><select class="select-default"><option selected="select"></option>
                                            <option>Ejemplo 1</option>
                                        </select>
                                        <label for="correccion_tecnica">Corrección Técnica</label>
                                        <select class="select-default">
                                            <option selected="select"></option>
                                            <option>Ejemplo 1</option>
                                        </select>
                                    </div>
                                    <div>
                                        <fieldset>
                                            <legend>Informe</legend>

                                            <div class="div-table">
                                                <div class="div-table-in"></div>
                                                <div class="div-table-in font-default">DTRL</div>
                                                <div class="div-table-in font-default">OPA</div>
                                                <div class="div-table-in font-default">Comisiones</div>
                                                <div class="div-table-in font-default">Otros</div>
                                            </div>
                                            <div align="center">
                                                <div class="div-table">
                                                    <div class="div-table-in font-default">Si</div>
                                                    <div class="div-table-in">
                                                        <input type="checkbox" />
                                                    </div>
                                                    <div class="div-table-in">
                                                        <input type="checkbox" />
                                                    </div>
                                                    <div class="div-table-in">
                                                        <input type="checkbox" />
                                                    </div>
                                                    <div class="div-table-in">
                                                        <input type="checkbox" />
                                                    </div>
                                                </div>
                                                <div class="div-table">
                                                    <div class="div-table-in font-default">&nbsp;&nbsp;No</div>
                                                    <div class="div-table-in">&nbsp;&nbsp;<input type="checkbox" /></div>
                                                    <div class="div-table-in">&nbsp;&nbsp;<input type="checkbox" /></div>
                                                    <div class="div-table-in">&nbsp;&nbsp;<input type="checkbox" /></div>
                                                    <div class="div-table-in">&nbsp;&nbsp;<input type="checkbox" /></div>
                                                </div>
                                                <div class="div-table">
                                                    <div class="div-table-in font-default">En espera</div>
                                                    <div class="div-table-in">
                                                        <input type="checkbox" />
                                                    </div>
                                                    <div class="div-table-in">
                                                        <input type="checkbox" />
                                                    </div>
                                                    <div class="div-table-in">
                                                        <input type="checkbox" />
                                                    </div>
                                                    <div class="div-table-in">
                                                        <input type="checkbox" />
                                                    </div>
                                                </div>
                                                <div class="div-table">
                                                    <div class="div-table-in"></div>
                                                    <div style="margin-left: 15px">
                                                        <button class="adjuntar-default" type="file">Adjuntar</button>
                                                    </div>
                                                    <div style="margin-left: 15px">
                                                        <button class="adjuntar-default" type="file">Adjuntar</button>
                                                    </div>
                                                    <div style="margin-left: 15px">
                                                        <button class="adjuntar-default" type="file">Adjuntar</button>
                                                    </div>
                                                    <div style="margin-left: 15px">
                                                        <button class="adjuntar-default" type="file">Adjuntar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="envio-destino">
                                <div style="height: 270px">
                                    <div>
                                        <div class="col col-4col">
                                            <label for="enviado_comision">Enviado a comisión por</label>
                                            <select class="select-default">
                                                <option selected="select"></option>
                                                <option>Usuario 1</option>
                                            </select>
                                            <label for="revisado_por">Revisado por</label>
                                            <select class="select-default">
                                                <option selected="select"></option>
                                                <option>Usuario 1</option>
                                            </select>
                                            <label for="despachado">Despachado por</label>
                                            <select class="select-default">
                                                <option selected="select"></option>
                                                <option>Usuario 1</option>
                                            </select>
                                            <label for="oficio_revisado">Oficio enviado a comisión</label>
                                            <select class="select-default">
                                                <option selected="select"></option>
                                                <option>Usuario 1</option>
                                            </select>
                                        </div>
                                        <div class="col col">
                                            <label style="color: #fff">.</label>
                                            <button type="file" class="adjuntar-default" style="margin-left: -28px !important;">Adjuntar</button>

                                            <label style="color: #fff">.</label>
                                            <button type="file" class="adjuntar-default" style="margin-left: -28px !important;">Adjuntar</button>

                                            <label style="color: #fff">.</label>
                                            <button type="file" class="adjuntar-default" style="margin-left: -28px !important;">Adjuntar</button>

                                            <label style="color: #fff">.</label>
                                            <button type="file" class="adjuntar-default" style="margin-left: -28px !important;">Adjuntar</button>
                                        </div>
                                        <div class="col col-4col">
                                            <label for="recibido_transacción">Recibido en transacción</label>
                                            <select class="select-default">
                                                <option selected="select"></option>
                                                <option>Transacción 1</option>
                                            </select>

                                            <label for="transcrito">Transcrito por</label>
                                            <select class="select-default">
                                                <option selected="select"></option>
                                                <option>Usuario 1</option>
                                            </select>

                                            <label for="despacho_transasicion">Despacho Transición</label>
                                            <input type="text" class="text-default" />

                                            <label for="no_oficio">No. Oficio despacho</label>
                                            <select class="select-default">
                                                <option selected="select"></option>
                                                <option>Número de oficio 1</option>
                                            </select>
                                        </div>
                                        <div class="col col">
                                            <label style="color: #fff">.</label>
                                            <button type="file" class="adjuntar-default" style="margin-left: -28px !important;">Adjuntar</button>

                                            <label style="color: #fff">.</label>
                                            <button type="file" class="adjuntar-default" style="margin-left: -28px !important;">Adjuntar</button>

                                            <label style="color: #fff">.</label>
                                            <button type="file" class="adjuntar-default" style="margin-left: -28px !important;">Adjuntar</button>

                                            <label style="color: #fff">.</label>
                                            <button type="file" class="adjuntar-default" style="margin-left: -28px !important;">Adjuntar</button>

                                        </div>
                                        <div style="padding-top: 1px;">
                                            <label for="notas">Notas</label>
                                            <textarea class="textarea-2col" style="width: 222px !important; height: 222px !important" cols="50" rows="20" placeholder="Puede escribir notas aquí"></textarea>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="estados_cambios">
                                <div style="height: 380px;">
                                    <div class="div6col">
                                        <label for="condicion_actual">Condición actual</label>
                                    </div>
                                    <div class="div6col">
                                        <select class="select-default">
                                            <option selected="select"></option>
                                            <option>Condición 1</option>
                                        </select>
                                    </div>

                                    <div class="div6col">
                                        <label for="fecha" style="margin-left: 16px;">Fecha</label>
                                    </div>
                                    <div class="div6col">
                                        <input type="text" class="text-default" />
                                    </div>

                                    <div class="div6col">
                                        <label for="responsable" style="margin-left: 16px;">Responsable</label>
                                    </div>
                                    <div>
                                        <input type="text" class="text-default" />
                                    </div>

                                    <!-- Data grid de el tab de estado   -->
                                    <div style="clear: both; margin: 0 0 20px 0"></div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dtt-estados-cambios">
                                                    <thead>
                                                        <tr class="table_heading">
                                                            <th></th>
                                                            <th>No. Orden</th>
                                                            <th>Descripción</th>
                                                            <th>Objetivo</th>
                                                            <th>Cargo </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox"></td>
                                                            <td>1204</td>
                                                            <td>Descripción aqui </td>
                                                            <td>809-548-5478</td>
                                                            <td>Cargo</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox"></td>
                                                            <td>6532</td>
                                                            <td>Descripción aqui 3</td>
                                                            <td>809-548-6666</td>
                                                            <td>Cargo</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox"></td>
                                                            <td>12014</td>
                                                            <td>Descripción aqui</td>
                                                            <td>809-548-4758</td>
                                                            <td>Cargo</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox"></td>
                                                            <td>8745</td>
                                                            <td>Descripción aqui</td>
                                                            <td>809-548-9663</td>
                                                            <td>Cargo</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <input type="checkbox"></td>
                                                            <td>8746</td>
                                                            <td>Descripción aqui</td>
                                                            <td>809-548-9874</td>
                                                            <td>Cargo</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
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
    <footer class="Mfooter">
        <p class="footer">Copyright © 2010 Senado de la República Dominicana | Derechos Reservados</p>
    </footer>
</asp:Content>

