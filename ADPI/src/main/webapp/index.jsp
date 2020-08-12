
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="Css/EstiloI2.css" rel="stylesheet" type="text/css"/>
        
        <title>JSP Page</title>
   
    <script>
            
            function Entrar(){
                
                var Usuario, Clave;
                Usuario=window.document.Login.txtU.value;
                Clave=window.document.Login.txtC.value;
                
                if (Usuario == ""){
                    
                    alert("Falta completar el campo de Usuario")
                    window.document.Login.txtU.focus();
                    return;
                    
                } else if (Clave == ""){
                    
                    alert("No ah registrado la clave")
                    window.document.Login.txtC.focus();
                    return;
                } else {
                    
                    window.document.Login.action="<%=request.getContextPath()%>/ControladorUs";
                    window.document.Login.method="GET";
                    window.document.Login.submit();
                    
                }
                
            }
            
        </script>
        
    </head>
    
    <body>  
        
    <center>
            
        <img src="Imagenes/encabezado.jpg" width="75%"/>
                
    </center>    
        
        <div id="Cuadro">
            
            <form name="Login">
                
                <p id="Titulo">INICIAR SESIÓN</p>
                
                <hr>
                
                <br/><br/>
                
                <label id="subtituloI"> NOMBRE DE USUARIO </label>
                
                <br/><br/>
                
                <input type="txt" class="entrada" name="txtU">
                
                <br/><br/>
                
                <label id="subtituloII"> CONTRASEÑA </label>
                
                <br/><br/>
                
                <input type="password" class="entrada" name="txtC">
                
                <br/><br/>
                
                <input type="button" value="Inicar Sesión" id="boton" onclick="Entrar()">
               
                <%
                   
                   if(request.getAttribute("mensaje")!=null){
                   
                   String msj = (String)request.getAttribute("mensaje");
                   
                   out.print(msj);
                   
               }
                   
               %> 
                
            </form>
            
            <br/><br/>
            
            <p id="marca">CINE PLANET</p>
            
        </div>
        
    </body>
    
</html>

