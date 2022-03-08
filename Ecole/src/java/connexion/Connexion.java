/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author P14A-Fanjava
 */
public class Connexion {
    public Connection connect() throws Exception
    {
            Class.forName("org.postgresql.Driver");
             Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/money","postgres","njava008");
              return con;
    }
}
