/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.data;

import com.sgc.model.SubClassification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author thiru
 */
public class SubClassificationDao {

    public ArrayList showSubclassification() {
        String sql = "SELECT * FROM sub sc "
                + "JOIN main mc ON sc.MCID=mc.MCID ORDER BY sc.MCID ";

        ArrayList<SubClassification> subClassificationList = new ArrayList<>();

        try {
            DatabaseConnect db = new DatabaseConnect();
            Connection con = db.getconnection();
            PreparedStatement stmt;
            stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                SubClassification subClassification = new SubClassification();
                subClassification.setSubClassificationId(rs.getString("SCID"));
                subClassification.setSubClassificationName(rs.getString("SCName"));
                subClassification.setMainClassificationId(rs.getString("MCID"));
                subClassification.setMainClassificationName(rs.getString("MCName"));
                subClassificationList.add(subClassification);
                //System.out.println(subClassification);
            }

        } catch (SQLException ex) {
//            Logger.getLogger(SubClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DatabaseConnect.disconnect();
        }

        return subClassificationList;

    }

    public ArrayList viewSubClassificationById(String subClassificationId) {
        String sql = "SELECT * FROM sub sc "
                + "JOIN main mc "
                + "ON sc.MCID = mc.MCID "
                + "WHERE sc.SCID = '" + subClassificationId + "'";

        ArrayList<SubClassification> subClassificationList = new ArrayList<>();
        try {
            DatabaseConnect db = new DatabaseConnect();
            Connection con = db.getconnection();
            PreparedStatement stmt;
            stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                SubClassification subClassification = new SubClassification();
                subClassification.setSubClassificationId(rs.getString("SCID"));
                subClassification.setSubClassificationName(rs.getString("SCName"));
                subClassification.setMainClassificationId(rs.getString("MCID"));
                subClassification.setMainClassificationName(rs.getString("MCName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SubClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DatabaseConnect.disconnect();
        }
        return subClassificationList;
    }

    public void addSubClassification(SubClassification subClassification) {
        DatabaseConnect db = new DatabaseConnect();
        Connection con = db.getconnection();
        PreparedStatement stmt;
        String sql = "INSERT INTO sub (SCID, SCName,MCID) "
                + "VALUES (?, ?, ?)";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, subClassification.getSubClassificationId());
            stmt.setString(2, subClassification.getSubClassificationName());
            stmt.setString(3, subClassification.getMainClassificationId());
            stmt.executeLargeUpdate();

        } catch (SQLException e) {
            System.out.println("PreparedStatement Query Error: " + e.getMessage());
        } finally {
            DatabaseConnect.disconnect();
        }
    }

    public void editSubClassification(SubClassification subClassification) {
        String sql = "UPDATE sub SET "
                + "SCName = ?, "
                + "MCID = ? "
                + "WHERE SCID = '" + subClassification.getSubClassificationId() + "'";

        try {
            DatabaseConnect db = new DatabaseConnect();
            Connection con = db.getconnection();
            PreparedStatement stmt;
            stmt = con.prepareStatement(sql);
            stmt.setString(1, subClassification.getSubClassificationName());
            stmt.setString(2, subClassification.getMainClassificationId());
            stmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("SQL Query Error Exception: " + ex);
        } finally {
            DatabaseConnect.disconnect();
        }
    }

    public void deleteSubclassification(String subClassificationId) {
        String sql = "DELETE FROM sub "
                + "WHERE SCID ='" + subClassificationId + "'";
        try {
            DatabaseConnect db = new DatabaseConnect();
            Connection con = db.getconnection();
            PreparedStatement stmt;
            stmt = con.prepareStatement(sql);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(" SQL Query Error Exception:" + e);
        } finally {
            DatabaseConnect.disconnect();
        }
    }

    public List searchSubClassificationByMainClassificationName(String firstFilterText) {
        String sql = "SELECT * FROM sub sc "
                + "JOIN main mc ON sc.MCID=mc.MCID "
                + "WHERE sc.SCID LIKE '" + firstFilterText + "%' "
                + "OR sc.SCName LIKE '" + firstFilterText + "%' "
                + "OR mc.MCName LIKE '" + firstFilterText + "%' "
                + "OR mc.MCID LIKE '" + firstFilterText + "%' "
                + "ORDER BY sc.MCID";

        List<SubClassification> subClassificationList = new ArrayList<>();

        try {
            DatabaseConnect db = new DatabaseConnect();
            Connection con = db.getconnection();
            PreparedStatement statement;
            statement = con.prepareStatement(sql);
            ResultSet rs;
            rs = statement.executeQuery();

            while (rs.next()) {
                SubClassification subClassification = new SubClassification();
                subClassification.setSubClassificationId(rs.getString("SCID"));
                subClassification.setSubClassificationName(rs.getString("SCName"));
                subClassification.setMainClassificationId(rs.getString("MCID"));
                subClassification.setMainClassificationName(rs.getString("MCName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DatabaseConnect.disconnect();
        }

        return subClassificationList;
    }
    
    public ArrayList subClassificationByMainClassification(String mainClassificationId) {
        String sql = "SELECT * FROM main mc "
                + "JOIN sub sc "
                + "ON mc.MCID=sc.MCID "
                + "WHERE sc.MCID='" + mainClassificationId + "'";

        ArrayList<SubClassification> subClassificationList = new ArrayList<>();

        try {
            DatabaseConnect db = new DatabaseConnect();
            Connection con = db.getconnection();
            Statement stmt = null;
            stmt=con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                SubClassification subClassification = new SubClassification();
                subClassification.setSubClassificationId(rs.getString("subClassificationId"));
                subClassification.setSubClassificationName(rs.getString("subClassificationName"));
                subClassification.setMainClassificationId(rs.getString("mainClassificationId"));
                subClassification.setMainClassificationName(rs.getString("mainClassificationName"));
                subClassificationList.add(subClassification);
            }

        } catch (SQLException ex) {
//            Logger.getLogger(SubClassificationDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Error Exception: " + ex.getMessage());
        } finally {
            DatabaseConnect.disconnect();
        }

        return subClassificationList;
    }

}
