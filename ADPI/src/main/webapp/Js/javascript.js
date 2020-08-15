function validarAccesoUsuario(ruta)
{
   var txtU = document.getElementById('txtU').value;
   var txtC = document.getElementById('txtC').value;


    if (txtU == '')
    {   
        JAlert("Ingresar el Usuario por favor!!!");
        document.getElementById('txtU').focus();
        return;
    }
    else
    {
        if (txtC == '')
        {   JAlert("Ingresar el Contraseña por favor!!!");
            document.getElementById('txtC').focus();
            return;
        }
        else
        {  
            document.Login.action=ruta+"/ControladorUs";
            document.Login.method="POST";
            document.Login.op.value="1";
            document.Login.submit();
        }
    }
}
