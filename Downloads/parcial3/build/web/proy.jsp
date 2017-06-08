<%-- 
    Document   : proy
    Created on : 26/05/2017, 09:15:48 AM
    Author     : Alumnos
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" %> <%-- para conectar con mysql --%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <%
        
        // crear e inicializar variables
        String correo, pass; // para ingresar
        int op = 0; // para seleccionar ingreso o registro

        //variables para la base de datos
        final String jdbcdriver = "com.mysql.jdbc.Driver";
        final String dburl = "jdbc:mysql://localhost/parcial3";
        // credenciales de la base de datos
        final String user = "root";
        final String passql = "";
        Connection con;
        Class.forName(jdbcdriver);

        con = DriverManager.getConnection(dburl, user, passql);

        Statement stmt = con.createStatement();
        String sql;
        ResultSet rs;
        
        //variables para obtener y mostrar los registros de la base
        String mail, contra, nombre, ape, usu;
        
        // proceso
        response.setContentType("text/html");
        
        correo = request.getParameter("correo");
        pass = request.getParameter("pass");
        
        //ver si va a entrar a la pagina o registrarse como nuevo
        if (correo.length()>0 && pass.length()>0  ){
            op = 1;
            //out.println("<a href=\"registro\" >Registrar</a>");
            //out.print(correo + pass);
        }
        else if(request.getParameter("entrar") != null)
        {
            
                out.println("<html lang=\"es\"> <head> <title>Login</title>"
                        + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
                        + "<meta name=\"viewport\" content=\"width=device-width\">  "
                        + "<link rel=\"stylesheet\" href=\"css/icono.css\">"
                        + "   </head>");
                
                        
                    out.print("<div class=\"contenedor\">");
                        out.println("<center>");
                        out.println("<div class=\"caja\">");
                        
                        out.print("<div class=\"icono\"> <a class=\"icon-user\" href=\"#\"></a> </div>");
                        
                        //out.print("<div> <img src=\"info2.jpg\"></div>");
                        //out.print("<p>Error de usuario o contraseña o faltan datos<p>");
                        
//                                out.println("<form action=\"proy.jsp\" method=\"post\" name=\"index\">");
//                                    out.println("<input type=\"email\" placeholder=\"Correo\" name=\"correo\" required/><br><br>");
//                                    out.println("<input type=\"password\" placeholder=\"Contraseña\" name=\"pass\" required/><br><br>");
//                                    out.println("<input type=\"submit\" value=\"Entrar\" name=\"entrar\"/><br><br>");
//                                out.println("</form>");
//                                
//                                out.print("<form action=\"registro\"> <input type=\"submit\" value=\"Registrar\"> </form>");
//                                
                        out.println("</div>");
                        out.println("</center>");
                    out.println("</div>");
            
        }
        if (request.getParameter("registrar") != null) {
            op = 2;
            //out.println("si lo hace<br>");
        }
        else
        {
            
        }
        
            
        switch(op){
            case 1:
                try{
                    sql = "select * from registro where registro.correo=\'" + correo + "\' and registro.pass=\'" + pass + "\'";
                    //ResultSet rs = stmt.executeQuery(sql);
                    rs = stmt.executeQuery(sql);
                    //validacion
                    if (rs.next()) {
                        // extraer el dato
                        //correo	pass	nombre	apellido    tipo
                        //while(rs.next()){
                            // retiro por columna con while para varios resultados con if uno solo
                            //mail = rs.getString("correo");
                            //contra = rs.getString("pass");
                            //nombre = rs.getString("nombre");
                            //ape = rs.getString("apellido");
                            //usu = rs.getString("tipo");
                            // mostrar valores
                            // se muestran los datos
                            /*
                            out.println("Correo: " + mail + " ");
                            out.println("Contra: " + contra + " ");
                            out.println("Nombre: " + nombre + " ");
                            out.println("Apellido: " + ape + " ");
                            out.println("Usuario: " + usu + " ");
                            */
                        //}
                        //usuario registrado
//                        out.println("<html lang=\"es\"> <head> <title>Login</title>"
//                            + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
//                            + "<meta name=\"viewport\" content=\"width=device-width\">     </head>");
//
//                        out.print("<div class=\"contenedor\">");
//                            out.println("<center>");
//
//                                //out.println("codigo de elia");
//
//                            out.println("</center>");
//                        out.println("</div>");

                        //response.sendRedirect("http://localhost:8080/parcial3/text.html");
                        //response.sendRedirect("text.html");
                        //response.sendRedirect("indexp.html");
                        response.sendRedirect("principal.html");
                        
                    }
                    else
                    {
                        out.println("<html lang=\"es\"> <head> <title>Login</title>"
                            + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
                            + "<meta name=\"viewport\" content=\"width=device-width\"> "
                                + "<link rel=\"stylesheet\" href=\"css/icono.css\">"
                                + "</head>");
                        

                        out.print("<div class=\"contenedor\">");
                            out.println("<center>");
                            out.println("<div class=\"caja\">");
                            out.print("<div class=\"icono\"> <a class=\"icon-user\" href=\"#\"></a> </div>");
                            //out.print("<div> <img src=\"info2.jpg\"></div>");
                                out.println("Error de usuario o contraseña");
                                    out.println("<form action=\"proy.jsp\" method=\"post\" name=\"index\">");
                                        out.println("<input type=\"email\" placeholder=\"Correo\" name=\"correo\" required/><br><br>");
                                        out.println("<input type=\"password\" placeholder=\"Contraseña\" name=\"pass\" required/><br><br>");
                                        out.println("<input type=\"submit\" value=\"Entrar\" name=\"entrar\"/><br><br>");
                                    out.println("</form>");

                                    out.print("<form action=\"registro\"> <input type=\"submit\" value=\"Registrar\"> </form>");

                            out.println("</div>");
                            out.println("</center>");
                        out.println("</div>");
                        
                        
//                        out.println("<html lang=\"es\"> <head> <title>Login</title>"
//                        + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
//                        + "<meta name=\"viewport\" content=\"width=device-width\">     </head>");
//                        out.print("<script languaje=\"javascript\" type=\"text/javascript\"> "
//                                + "alert(\"hola\");"
//                        + "</script>");
                        
                        
                        
                        //response.sendRedirect("index.html");

                                           
                    
                    
                    }
                    // limpiar y cerrar la conexion
                    rs.close();
                }
                catch(Exception e)
                {
                    out.println(""+ e);
                }
                break;
            case 2:
                // uso de funciones y de css en jsp
                try
                {
                    String var="";
                    //out.println("Usted esta tratando de registrar a " + var);
                    //correo	pass	nombre	apellido	tipo
                    mail = request.getParameter("correo");
                    contra = request.getParameter("pass");
                    nombre = request.getParameter("nombre");
                    ape = request.getParameter("apellido");
                    usu = request.getParameter("tipU");
                    
                    if (mail.length() >0 && contra.length() >0 && nombre.length() >0 && ape.length() >0 && usu.length() >0) 
                    {
                        var = mail + "','" + contra + "\',\'" + nombre + "\',\'" + ape + "\',\'" + usu;
                        //out.println(var);
                        sql = "insert into registro(correo,pass,nombre,apellido,tipo) values(\'" + var +"\')";
                        //out.println(mail + " " + contra + " " + nombre + " " + ape + " " + usu + " se agrego");
                        stmt.executeUpdate(sql);

                        out.println("<html lang=\"es\"> <head> <title>Login</title>"
                            + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
                            + "<meta name=\"viewport\" content=\"width=device-width\">"
                                + "<link rel=\"stylesheet\" href=\"css/icono.css\">"
                                + " </head>");

                        out.print("<div class=\"contenedor\">");
                            out.println("<center>");
                            out.println("<div class=\"caja\">");
                            out.print("<div class=\"icono\"> <a class=\"icon-user\" href=\"#\"></a> </div>");
                            
                            //out.print("<div> <img src=\"info2.jpg\"></div>");
                                out.println("Usuario registrado");
                                    out.println("<form action=\"proy.jsp\" method=\"post\" name=\"index\">");
                                        out.println("<input type=\"email\" placeholder=\"Correo\" name=\"correo\" required/><br><br>");
                                        out.println("<input type=\"password\" placeholder=\"Contraseña\" name=\"pass\" required/><br><br>");
                                        out.println("<input type=\"submit\" value=\"Entrar\" name=\"entrar\"/><br><br>");
                                    out.println("</form>");

                                    out.print("<form action=\"registro\"> <input type=\"submit\" value=\"Registrar\"> </form>");

                            out.println("</div>");
                            out.println("</center>");
                        out.println("</div>");
                    }
                    else // fallo el registro
                    {
                        out.println("<html lang=\"es\"> <head> <title>Login</title>"
                            + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
                            + "<meta name=\"viewport\" content=\"width=device-width\"> "
                                + "<link rel=\"stylesheet\" href=\"css/icono.css\">"
                                + "</head>");

                        out.print("<div class=\"contenedor\">");
                            out.println("<center>");
                            out.println("<div class=\"caja\">");
                            out.print("<div class=\"icono\"> <a class=\"icon-user\" href=\"#\"></a> </div>");
                            //out.print("<div> <img src=\"info2.jpg\"></div>");
                                //out.println("Error de usuario, contraseña o faltan datos");
//                                    out.println("<form action=\"proy.jsp\" method=\"post\" name=\"index\">");
//                                        out.println("<input type=\"email\" placeholder=\"Correo\" name=\"correo\" required/><br><br>");
//                                        out.println("<input type=\"password\" placeholder=\"Contraseña\" name=\"pass\" required/><br><br>");
//                                        out.println("<input type=\"submit\" value=\"Entrar\" name=\"entrar\"/><br><br>");
//                                    out.println("</form>");
//
//                                    out.print("<form action=\"registro\"> <input type=\"submit\" value=\"Registrar\"> </form>");

                            out.println("</div>");
                            out.println("</center>");
                        out.println("</div>");
                        
                    }
                    //rs.close();
                    break;
                }
                catch(Exception e)
                {
                    
                    
                    out.println("<html lang=\"es\"> <head> <title>Login</title>"
                        + "<meta charset=\"UTF-8\"> <link rel=\"stylesheet\" href=\"main.css\"/>"
                        + "<meta name=\"viewport\" content=\"width=device-width\">     </head>");
                        
                    out.print("<div class=\"contenedor\">");
                        out.println("<center>");
                            out.println("El usuario esta registrado"
                                + "<form action=\"index.html\" method=\"post\">"
                                + "<input type=\"submit\" value=\"Volver\" name=\"entrar\"/><br><br>"
                                + "</form>");
                        out.println("</center>");
                    out.println("</div>");
                }
                break;                         
        }
    %>
        
    </body>
</html>
