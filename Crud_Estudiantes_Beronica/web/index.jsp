<%-- 
    Document   : index
    Created on : 3/10/2022, 05:06:29 PM
    Author     : BEONICA
--%>

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.Map.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Sangre" %>
<%@page import="modelo.Estudiante" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Estudiante</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        
        
    </head>
    <body>
        <h1 align="center">Formulario Estudiantes</h1>
        <!-- Barra de Navegacion -->
        <nav class="site-header sticky-top py-1">
  <div class="container d-flex flex-column flex-md-row justify-content-between">
    <a class="py-2" href="#" aria-label="Product">
      
    </a>
    <a class="py-2 d-none d-md-inline-block" href="#">Inicio</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Nosotros</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Contacto</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Sub-menu</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Ubicacion</a>
    
    <button type="button" class="btn btn-dark" id="boton">Iniciar</button>
    <button type="button" class="btn btn-dark" id="boton">Cerrar</button>
    
  </div>
</nav>
                
    <div class="container">
            
    <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        
        <div class="modal-body">
          <form action="sr_estudiante" method="post" class="form-group">
            <label for="lbl_id"><b> ID </b> </label>
            <input type="text" name="txt_id" id="txt_id" value="0" class="form-control" readonly>
            <label for="lbl_carne"><b>Carnet</b></label>
            <input type="text" name="txt_carne" id="txt_carne" class="form-control" placeholder="Ejemplo: E001" pattern="[E0-9]{4}" required>
            
            <label for="lbl_nombres"><b>Nombres</b></label>
            <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 Nombres 2" required>
            
            <label for="lbl_apellidos"><b>Apellidos</b></label>
            <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido 1 Apellido 2" required>
            
            <label for="lbl_direccion"><b>Direccion</b></label>
            <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: # Casa Calle Zona Ciudad" required>
            
            <label for="lbl_telefono"><b>Telefono</b></label>
            <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555" required>
            
            <label for="lbl_correo"><b>Correo Electronico</b></label>
            <input type="text" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo: ejemplo@gmail.com" required>
            
            <label for="lbl_fn"><b>Fecha nacimiento</b></label>
            <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
            
            <label for="lbl_sangre"> <b>Tipo de Sangre</b></label>
            <select name="drop_sangre" id="drop_sangre" class="form-control">
                <% Sangre sangre = new Sangre();
                HashMap<String,String> drop = sangre.drop_sangre();
                    for(String i : drop.keySet()){
                    out.println("<option value='" + i +"'>" + drop.get(i) + "</option>");
                    }
                %>
            </select>
            <br>
            
            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-success">Agregar</button>
            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary" > Modificar</button>
            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?, consulte de nuevo')) return false" > Eliminar </button>
            <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>    
        </form>
        </div>
        </div>
      
    </div>
  </div>
          
            
            <!-- Inicio de la Tabla Leer -->
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Carnet</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>Correo</th>
                    <th>Fecha nacimiento</th>
                    <th>Sangre</th>
                    
                </tr>
                </thead>
                <tbody id="tbl_estudiante">
                <% Estudiante estudiante = new Estudiante();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = estudiante.leer();
                    for (int t= 0; t<tabla.getRowCount(); t++) {
                            out.println("<tr data-id="+ tabla.getValueAt(t, 0)+" data-id_p=" + tabla.getValueAt(t, 8)+">");
                            out.println("<td> <a data-toggle='modal' data-target='#modal_1"+tabla.getValueAt (t,1)+" '> "+ tabla.getValueAt (t,1) + "</a></td>");
                            out.println("<td>"+ tabla.getValueAt (t,2) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,3) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,4) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,5) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,6) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,7) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,8) + "</td>");
                            out.println("</tr>");
                            %>
         <div class="modal fade" id="modal_1<% out.print(tabla.getValueAt (t,1)); %>"  role="dialog">
        <div class="modal-dialog">
                <div class="modal-content">
        
        <div class="modal-body">
          <form action="sr_estudiante" method="post" class="form-group">
            <label for="lbl_id"><b> ID </b> </label>
            <input type="text" name="txt_id" id="txt_id" value="<% out.print(tabla.getValueAt (t,0)); %>" class="form-control" readonly>
            
            <label for="lbl_carne"><b>Carnet</b></label>
            <input type="text" name="txt_carne" id="txt_carne" class="form-control" placeholder="Ejemplo: E001" pattern="[E0-9]{4}" required value="<% out.print(tabla.getValueAt (t,1)); %>">
            
            <label for="lbl_nombres"><b>Nombres</b></label>
            <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 Nombres 2" value="<% out.print(tabla.getValueAt (t,2)); %>" required>
            
            <label for="lbl_apellidos"><b>Apellidos</b></label>
            <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido 1 Apellido 2" value="<% out.print(tabla.getValueAt (t,3)); %>" required>
            
            <label for="lbl_direccion"><b>Direccion</b></label>
            <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: # Casa Calle Zona Ciudad" value="<% out.print(tabla.getValueAt (t,4)); %>" required>
            
            <label for="lbl_telefono"><b>Telefono</b></label>
            <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555" value="<% out.print(tabla.getValueAt (t,5)); %>" required>
            
            <label for="lbl_correo"><b>Correo Electronico</b></label>
            <input type="text" name="txt_correo" id="txt_correo" class="form-control" placeholder="Ejemplo: ejemplo@gmail.com" value="<% out.print(tabla.getValueAt (t,6)); %>"required>
            
            <label for="lbl_fn"><b>Fecha nacimiento</b></label>
            <input type="date" name="txt_fn" id="txt_fn" class="form-control" value="<% out.print(tabla.getValueAt (t,7)); %>"required>
            
            <label for="lbl_sangre"> <b>Tipo de Sangre</b></label>
            <input type="text" name="drop_sangre" id="drop_sangre" class="form-control" value="<% out.print(tabla.getValueAt (t,8)); %>"required>        
            
            <br>
            
            <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-success">Agregar</button>
            <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary" > Modificar</button>
            <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?, consulte de nuevo')) return false" > Eliminar </button>
            <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>    
        </form>
        </div>
        </div>
             </div>
        </div>
                    <%
                        }
                  %>
                  
                  
                </tbody>
                
            </table>
                  <!-- Boton Para crear nuevo registro -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo Registro</button>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script type="text/javascript">
            function limpiar(){
                $('#txt_id').val(0);
                $('#drop_sangre').val(1);
                $('#txt_carne').val('');
                $('#txt_nombres').val('');
                $('#txt_apellidos').val('');
                $('#txt_direccion').val('');
                $('#txt_telefono').val('');
                $('#txt_correo').val('');
                $('#txt_fn').val('');
            }
            
            $('#tbl_estudiante').on('click','tr td',function(evt){
                var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,correo,nacimiento;
                target = $(event.target);
                id = target.parent().data('id');
                id_p = target.parent().data('id_p');
                codigo = target.parent("tr").find("td").eq(0).html();
                nombres = target.parent("tr").find("td").eq(1).html();
                apellidos = target.parent("tr").find("td").eq(2).html();
                direccion = target.parent("tr").find("td").eq(3).html();
                telefono = target.parent("tr").find("td").eq(4).html();
                correo = target.parent("tr").find("td").eq(5).html();
                nacimiento = target.parent("tr").find("td").eq(6).html();
                $('#txt_id').val(id);
                $('#drop_sangre').val(id_p);
                $('#txt_carne').val(codigo);
                $('#txt_nombres').val(nombres);
                $('#txt_apellidos').val(apellidos);
                $('#txt_direccion').val(direccion);
                $('#txt_telefono').val(telefono);
                $('#txt_correo').val(correo);           
                $('#txt_fn').val(nacimiento);
                $("#modal_empleado").modal('show');
            });
            
        </script>
    </body>
</html>
