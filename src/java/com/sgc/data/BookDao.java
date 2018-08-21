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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author thirupparan
 */
public class BookDao {

    public void saveBook(Book book) throws ClassNotFoundException, SQLException {
        //Statement stmt = con.createStatement();
        DatabaseConnect db = new DatabaseConnect();
        Connection con = db.getconnection();
        PreparedStatement statement;
        try {
            String bookid = book.getBookId();
            String title = book.getTitle();
            String author = book.getAuthor();
            String mainclass = book.getMainClassification();
            String subclass = book.getSubClassification();
            String yearofpublish = book.getYearOfPublishing();
            String lastprintedyear = book.getLastPrintedYear();
            String isbn = book.getISBN();
            String noofpages = book.getNoOfPages();

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
        } catch (SQLException e) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    /**
     *
     * @return @throws ClassNotFoundException
     * @throws java.sql.SQLException
     */
    public ArrayList<Book> showBook() throws SQLException, ClassNotFoundException {
        ArrayList<Book> result = new ArrayList<>();

        DatabaseConnect db = new DatabaseConnect();
        Connection con = db.getconnection();
        PreparedStatement statement;

        String showSQL = "SELECT * FROM books b"
                + " JOIN Sub sc ON b.SCID = sc.SCID"
                + " JOIN main mc ON mc.MCID=b.MCID";

        statement = con.prepareStatement(showSQL);
        ResultSet rsShow = statement.executeQuery();

        while (rsShow.next()) {
            Book book = new Book();
            book.setBookId(rsShow.getString("BookID"));
            book.setTitle(rsShow.getString("Title"));
            book.setAuthor(rsShow.getString("Author"));
            book.setMainClassification(rsShow.getString("MCName"));
            book.setSubClassification(rsShow.getString("SCName"));
            book.setYearOfPublishing(rsShow.getString("YearOfPublishing"));
            book.setLastPrintedYear(rsShow.getString("LastPrintedYear"));
            book.setISBN(rsShow.getString("ISBNno"));
            book.setNoOfPages(rsShow.getString("NoOfPages"));
            //book.setMainClassificationName(rsShow.getString("MCName"));
            //book.setSubClassification(rsShow.getString("SCName"));

            result.add(book);

        }
        DatabaseConnect.disconnect();
        return result;
    }

    public void deleteBook(String bookId) throws SQLException, ClassNotFoundException {
        DatabaseConnect db = new DatabaseConnect();
        Connection con = db.getconnection();
        PreparedStatement statement;

        String deleteSQL = "DELETE FROM books WHERE BookID = ?";

        statement = con.prepareStatement(deleteSQL);
        statement.setString(1, bookId);
        statement.executeUpdate();
        DatabaseConnect.disconnect();
    }

    public void updateBook(Book book) throws SQLException, ClassNotFoundException {
        //Book book = new Book();
        String bookId = book.getBookId();
        DatabaseConnect db = new DatabaseConnect();
        Connection con = db.getconnection();
        //Statement stmt;
        try {
            String sqlUpdate = "UPDATE books SET "
                    + "Title = ?,"
                    + "Author = ?,"
                    + "MCID =?,"
                    + "SCID =?,"
                    + "YearOfPublishing =?,"
                    + "LastPrintedYear =?,"
                    + "ISBNno =?,"
                    + "NoOfPages =? "
                    + "WHERE BookID ='" + bookId + "'";
            //con.setAutoCommit(false);
            // Book book = new Book();
            PreparedStatement pstmt = con.prepareStatement(sqlUpdate);
            //pstmt.setString(9, book.getBookId());
            pstmt.setString(1, book.getTitle());
            pstmt.setString(2, book.getAuthor());
            pstmt.setString(3, book.getMainClassification());
            pstmt.setString(4, book.getSubClassification());
            pstmt.setString(5, book.getYearOfPublishing());
            pstmt.setString(6, book.getLastPrintedYear());
            pstmt.setString(7, book.getISBN());
            pstmt.setString(8, book.getNoOfPages());
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            // Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL Query Error Exception: " + ex);
        } finally {
            DatabaseConnect.disconnect();

        }
    }

    public ArrayList viewBookById(String bookId) throws ClassNotFoundException {
        String sql = "SELECT * FROM books b"
                + " JOIN Sub sc ON b.SCID = sc.SCID"
                + " JOIN main mc ON mc.MCID=b.MCID"
                + " WHERE BookID ='" + bookId + "'";

        ArrayList<Book> bookList = new ArrayList<>();
        try {
            DatabaseConnect db = new DatabaseConnect();
            Connection con = db.getconnection();
            PreparedStatement statement;
            statement = con.prepareStatement(sql);
            ResultSet rsShow = statement.executeQuery();

            while (rsShow.next()) {
                Book book = new Book();
                book.setBookId(rsShow.getString("BookID"));
                book.setTitle(rsShow.getString("Title"));
                book.setAuthor(rsShow.getString("Author"));
                book.setMainClassification(rsShow.getString("MCID"));
                book.setSubClassification(rsShow.getString("SCID"));
                book.setMainClassificationName(rsShow.getString("MCName"));
                book.setSubClassificationName(rsShow.getNString("SCName"));
                book.setYearOfPublishing(rsShow.getString("YearOfPublishing"));
                book.setLastPrintedYear(rsShow.getString("LastPrintedYear"));
                book.setISBN(rsShow.getString("ISBNno"));
                book.setNoOfPages(rsShow.getString("NoOfPages"));

                bookList.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DatabaseConnect.disconnect();
        }
        return bookList;
    }

    public ArrayList serarchBook(String bookId) throws ClassNotFoundException {
        String sql = "SELECT * FROM books b "
                + " JOIN main mc ON mc.MCID=b.MCID "
                + " JOIN sub sc ON sc.SCID =b.SCID "
                + " WHERE BookID LIKE '" + bookId + "%'"
                + " OR sc.SCName LIKE '" + bookId + "%'"
                + " OR mc.MCName LIKE '" + bookId + "%'"
                + " OR b.Title LIKE '" + bookId + "%'"
                + " OR b.Author LIKE '" + bookId + "%'"
                + " OR b.YearOfPublishing LIKE '" + bookId + "%'"
                + " OR b.LastPrintedYear LIKE '" + bookId + "%'"
                + " OR b.ISBNno LIKE '" + bookId + "%'"
                + " ORDER BY b.BookID ";

        ArrayList<Book> bookList = new ArrayList<>();
        try {
            DatabaseConnect db = new DatabaseConnect();
            Connection con = db.getconnection();
            PreparedStatement statement;
            statement = con.prepareStatement(sql);
            ResultSet rsShow = statement.executeQuery();

            while (rsShow.next()) {
                Book book = new Book();
                book.setBookId(rsShow.getString("BookID"));
                book.setTitle(rsShow.getString("Title"));
                book.setAuthor(rsShow.getString("Author"));
                book.setMainClassification(rsShow.getString("MCName"));
                book.setSubClassification(rsShow.getString("SCName"));
                //book.setMainClassificationName(rsShow.getString("MCName"));
                //book.setSubClassificationName(rsShow.getNString("SCName"));
                book.setYearOfPublishing(rsShow.getString("YearOfPublishing"));
                book.setLastPrintedYear(rsShow.getString("LastPrintedYear"));
                book.setISBN(rsShow.getString("ISBNno"));
                book.setNoOfPages(rsShow.getString("NoOfPages"));

                bookList.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DatabaseConnect.disconnect();
        }
        return bookList;
    }

}
