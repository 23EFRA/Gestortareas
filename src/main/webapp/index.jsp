<%@page import="com.emergentes.modelo.Tarea"%>
<%@page import="java.util.ArrayList"%>
<% 
    if(session.getAttribute("listatarea")==null){
        ArrayList<Tarea>lisaux=new ArrayList<Tarea>();
        session.setAttribute("listatarea", lisaux);
    }
    ArrayList<Tarea>lista=(ArrayList<Tarea>)session.getAttribute("listatarea");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .nuevo{
                color: green;
                font-family: century;
                size:100px;
                  
            }
            p{
                color: blue;
                font-family: new curier;
                size:500px; 
          table {
  border: yellow 5px solid;
            } 
            th{
  color: red;
            }
        </style>
    </head>
    <body>
    <center>

        <h1><b>Gestor de Tareas</b></h1>
        <p><b>Nombre:</b> EFRAIN FLORES ROJAS</p>
        <a class='nuevo' href="MainServlet?op=nuevo">Nuevo registro</a>
        <br> <br>
        <table border="3">
            <tr>
                <th>Id</th>
                <th>Tarea</th>
                <th>Completado</th>
                <th colspan="2">Acciones</th>
                
            </tr>
            <%
                if(lista !=null){
                    for(Tarea item: lista){ 
            %>
            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getTarea()%></td>
                <td> 
                    <input type="checkbox" <%if(item.getCompletado().equals("si")){%> checked="checked" <%}%> />
                </td>
                <td>
                    <a href="MainServlet?op=editar&id=<%=item.getId()%>">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%=item.getId()%>" onclick="return(confirm('Esta seguro de eliminar??'))">Eliminar</a>
                </td>
            </tr>
            <%  
                    }
                }
            %>
        </table>
        
        </center>
    </body>
</html>
