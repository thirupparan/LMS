/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.data;

import com.sgc.model.Book;
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
 * @author thirupparan
 */
public class BookDao {

    private String MainClassification;
    private String SubClassification;

    public void saveBook(Book book) throws ClassNotFoundException, SQLException {
        try {
            DatabaseConnect db = new DatabaseConnect();
            Connection con = db.getconnection();
            String bookid = book.getBookId();
            String title = book.getTitle();
            String author = book.getAuthor();
            String mainclass = book.getMainClassification();
            String subclass = book.getSubClassification();
            String yearofpublish = book.getYearOfPublishing();
            String lastprintedyear = book.getLastPrintedYear();
            String isbn = book.getISBN();
            String noofpages = book.getNoOfPages();

            //Statement stmt = con.createStatement();
            PreparedStatement statement;
            String insertBook = "INSERT INTO books (BookID,Title,Author,MCID,SCID,YearOfPublishing,LastPrintedYear,ISBNno,NoOfPages) VALUES (?,?,?,?,?,?,?,?,?)";
            statement = con.prepareStatement(insertBook);
            statement.setString(1, bookid);
            statement.setString(2, title);
            statement.setString(3, author);
            statement.setString(4, mainclass);
            statement.setString(5, subclass);
            statement.setString(6, yearofpublish);
            statement.setString(7, lastprintedyear);
            statement.setString(8, isbn);
            statement.setString(9, noofpages);
            statement.executeUpdate();
            DatabaseConnect.disconnect();
        } catch (Exception e) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    /**
     *
     * @return @throws ClassNotFoundException
     * @throws java.sql.SQLException
     */
    public List<Book> showBook() throws SQLException {
        List<Book> result = new ArrayList<>();

        DatabaseConnect db = new DatabaseConnect();
        Connection con = db.getconnection();
        PreparedStatement statement;

        String showSQL = "SELECT * FROM books ORDER BY BookID";

        statement = con.prepareStatement(showSQL);
        ResultSet rsShow = statement.executeQuery();

        while (rsShow.next()) {
            Book book = new Book();
            book.setBookId(rsShow.getString("BookID"));
            book.setTitle(rsShow.getString("Title"));
            book.setAuthor(rsShow.getString("Author"));
            book.setMainClassification(rsShow.getString("MCID"));
            book.setSubClassification(rsShow.getString("SCID"));
            book.setYearOfPublishing(rsShow.getString("YearOfPublishing"));
            book.setLastPrintedYear(rsShow.getString("LastPrintedYear"));
            book.setISBN(rsShow.getString("ISBNno"));
            book.setNoOfPages(rsShow.getString("NoOfPages"));

            result.add(book);

        }
        DatabaseConnect.disconnect();
        return result;
    }

    public void deleteBook(String bookId) throws SQLException {
        DatabaseConnect db = new DatabaseConnect();
        Connection con = db.getconnection();
        PreparedStatement statement;

        String deleteSQL = "DELETE FROM books WHERE BookID = ?";

        statement = con.prepareStatement(deleteSQL);
        statement.setString(1, bookId);
        statement.executeUpdate();
        DatabaseConnect.disconnect();
    }

    public void updateBook(String bookID) throws SQLException {

        DatabaseConnect db = new DatabaseConnect();
        Connection con = db.getconnection();
        Statement stmt;
        try {
            stmt = con.createStatement();
            String MCID = null, SCID = null;
            String getMainClassificationID = "SELECT MCID FROM main WHERE MCName = '" + MainClassification + "'";
            String getSubClassificationID = "SELECT * from main mc "
                    + "JOIN sub sc on mc.MCID = sc.MCID "
                    + "WHERE MCName = '" + MainClassification + "' and SCName = '" + SubClassification + "'";
            ResultSet rsMCID = stmt.executeQuery(getMainClassificationID);
            while (rsMCID.next()) {
                MCID = rsMCID.getString("MCID");
            }
            ResultSet rsSCID = stmt.executeQuery(getSubClassificationID);
            while (rsSCID.next()) {
                SCID = rsSCID.getString("SCID");
            }
            String sqlUpdate = "UPDATE books SET"
                    + "Title = ?,"
                    + "Author = ?,"
                    + "MCID = ?,"
                    + "SCID =?,"
                    + "YearOfPublishing =?,"
                    + "LastPrintedYear =?,"
                    + "ISBNno =?,"
                    + "NoOfPages = ?"
                    + "WHERE BookID ='" + bookID + "'";
            con.setAutoCommit(false);
            Book book = new Book();
            PreparedStatement pstmt = con.prepareStatement(sqlUpdate);
            pstmt.setString(1, book.getTitle());
            pstmt.setString(2, book.getAuthor());
            pstmt.setString(3, book.getMainClassification());
            pstmt.setString(4, book.getSubClassification());
            pstmt.setString(5, book.getYearOfPublishing());
            pstmt.setString(6, book.getLastPrintedYear());
            pstmt.setString(7, book.getISBN());
            pstmt.setString(8, book.getNoOfPages());
            //pstmt.setString(9,book.getBookId());
            pstmt.executeUpdate();
            DatabaseConnect.disconnect();

        } catch (SQLException ex) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
