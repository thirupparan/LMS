/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author thirupparan
 */
public class DatabaseConnect {

    static Connection con = null;

    public Connection getconnection()//common method
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?useSSL=false", "root", "manager");
            System.out.println("connected Database!");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, new String(" Error.." + e));
        }
        return con;
    }

    public static void disconnect() {
        if (con != null) {
            try {
                con.close();
                System.out.println("Connection closed!");
            } catch (SQLException es) {
                System.out.println("ERROR :" + es);
            }
        }
    }

}
