function validarAccesoAdministrador(ruta)
{
   var txtusu = document.getElementById('txtusu').value;
   var txtcont = document.getElementById('txtcont').value;


    if (txtusu == '')
    {   
        JAlert("Ingresar el Usuario por favor!!!");
        document.getElementById('txtusu').focus();
        return;
    }
    else
    {
        if (txtcont == '')
        {   JAlert("Ingresar el Contraseña por favor!!!");
            document.getElementById('txtcont').focus();
            return;
        }
        else
        {  
            document.Login.action=ruta+"/AdministradorServlet";
            document.Login.method="POST";
            document.Login.op.value="1";
            document.Login.submit();
        }
    }
}

