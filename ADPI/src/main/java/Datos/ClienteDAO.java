package Datos;
import Bean.*;
import Util.ConectorBD;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteDAO {
    Connection                      cn=null;
    PreparedStatement               pt=null;
    ResultSet                       rs=null;
    ArrayList<ClienteBean>          lista=null;
    ClienteBean                     objClienteBean=null;
    
    public int ValidarCliente(ClienteBean objClienteBean){
        int val=0;
        try {
            cn=ConectorBD.getConectorBD();
            pt=cn.prepareStatement("SELECT COUNT(*) FROM cliente WHERE USUARIO=? AND CONTRASEÑA=?");
            pt.setString(1, objClienteBean.getUSUARIO());
            pt.setString(2, objClienteBean.getCONTRASEÑA());
            rs=pt.executeQuery();
            if(rs.next())
            { val=rs.getInt(1);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
            
        }
        return val;
    }
    
    public ClienteBean DatosCliente(ClienteBean objClienteBean){
        ClienteBean  obj=null;
        try {
            cn=ConectorBD.getConectorBD();
            pt=cn.prepareStatement("SELECT * FROM cliente WHERE USUARIO=? AND CONTRASEÑA=?");
            pt.setString(1, objClienteBean.getUSUARIO());
            pt.setString(2, objClienteBean.getCONTRASEÑA());
            rs=pt.executeQuery();
            if(rs.next()){
              obj=new ClienteBean();
              obj.setIDCLIENTE(rs.getInt(1));
              obj.setNOMBRE(rs.getString(2));
              obj.setAPELLIDOS(rs.getString(3));
              obj.setEMAIL(rs.getString(4));
              obj.setTELEFONO(rs.getString(5));
              obj.setUSUARIO(rs.getString(6));
              obj.setCONTRASEÑA(rs.getString(7));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return obj;
    }
}
