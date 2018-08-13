/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.data;

import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.protocol.a.result.ResultsetRowsStreaming;
import com.sgc.model.MainClassification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author thirupparan
 */
public class MainClassificationDao {

    DatabaseConnect db = new DatabaseConnect();
    Connection con = db.getconnection();
    PreparedStatement pstmt = null;
    String sql = "INSERT INTO main (MCID, MCName) "
            + "VALUES (?, ?)";

    public void addClassification(MainClassification mainClassification) {
        try {
            //DatabaseConnect db = new DatabaseConnect();
            //Connection con = db.getconnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, mainClassification.getMainClassificationId());
            pstmt.setString(2, mainClassification.getMainClassificationName());
            pstmt.executeUpdate();
            DatabaseConnect.disconnect();

        } catch (Exception e) {
            System.out.println("PreparedStatement Query Error: " + e.getMessage());
        }

    }

    public List<MainClassification> showMainclassification() throws SQLException {
        try {
            List<MainClassification> result = new ArrayList<>();
            //DatabaseConnect db = new DatabaseConnect();
            //Connection con = db.getconnection();
            PreparedStatement statement;
            String showSQL = "SELECT * FROM main ORDER BY MCID";

            statement = con.prepareStatement(showSQL);
            ResultSet rsShow = statement.executeQuery();
            while (rsShow.next()) {
                MainClassification mainClassification = new MainClassification();
                mainClassification.setMainClassificationId(rsShow.getString("MCID"));
                mainClassification.setMainClassificationName(rsShow.getString("MCName"));
                result.add(mainClassification);
            }
            return result;
        } catch (SQLException e) {
            System.out.println("PreparedStatement Query Error: " + e.getMessage());
        }
        DatabaseConnect.disconnect();
        return null;
    }

    public List<MainClassification> viewMainClassificationById(String mainClassificationId) throws SQLException {
        try {
            List<MainClassification> result = new ArrayList<>();
            //DatabaseConnect db = new DatabaseConnect();
            //Connection con = db.getconnection();
            PreparedStatement statement;
            String showSQL = "SELECT * FROM main WHERE MCID = '" + mainClassificationId + "'";

            statement = con.prepareStatement(showSQL);
            ResultSet rsShow = statement.executeQuery();
            while (rsShow.next()) {
                MainClassification mainClassification = new MainClassification();
                mainClassification.setMainClassificationId(rsShow.getString("MCID"));
                mainClassification.setMainClassificationName(rsShow.getString("MCName"));
                result.add(mainClassification);
            }
            return result;
        } catch (SQLException e) {
            System.out.println("PreparedStatement Query Error: " + e.getMessage());
        }
        DatabaseConnect.disconnect();
        return null;
    }

    public void updateMainClassification(MainClassification mainClassification) throws SQLException {
        //Connection con = db.getconnection();
        try {

            PreparedStatement stmt;
            String id = mainClassification.getMainClassificationId();
            String sqlUpdate = "UPDATE main SET "
                    + "MCName = ? "
                    + "WHERE MCID ='" + mainClassification.getMainClassificationId() + "'";
            stmt = con.prepareStatement(sqlUpdate);
            stmt.setString(1, mainClassification.getMainClassificationName());
            stmt.executeUpdate();
            DatabaseConnect.disconnect();

        } catch (SQLException ex) {
            Logger.getLogger(MainClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("PreparedStatement Query Error: " + ex.getMessage());
        }

    }

    public void deleteMainclassification(String MCID) throws SQLException {
        String deletesql = "DELETE FROM main "
                + "WHERE MCID = '" + MCID + "'";
        try {
            //Connection con = db.getconnection();
            //PreparedStatement pstmt;
            pstmt = con.prepareStatement(deletesql);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("SQL Query Error Exception: " + e);
        } finally {
            DatabaseConnect.disconnect();
        }
    }

    public List<MainClassification> searchMainClassification(String searchID) throws SQLException {
        String sql = "SELECT * FROM main "
                + "WHERE MCID LIKE '" + searchID + "%' "
                + "OR MCName LIKE '" + searchID + "%' "
                + "ORDER BY MCID";
        List<MainClassification> mainClassificationList = new ArrayList<>();
        //DatabaseConnect db = new DatabaseConnect();
        //Connection con = db.getconnection();
        PreparedStatement statement;
        try {
            statement = con.prepareCall(sql);
            ResultSet rsShow = statement.executeQuery();
            while (rsShow.next()) {
                MainClassification mainClassification = new MainClassification();
                mainClassification.setMainClassificationId(rsShow.getString("MCID"));
                mainClassification.setMainClassificationName(rsShow.getString("MCName"));
                mainClassificationList.add(mainClassification);
            }
        } catch (SQLException e) {
            System.out.println("SQL Error Exception: " + e.getMessage());
        } finally {
            DatabaseConnect.disconnect();
        }
        return mainClassificationList;
    }
}
