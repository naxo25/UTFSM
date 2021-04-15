/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Sql;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.*;

/**
 *
 * @author alumnosinf
 */
public class SqlConnection {
    private Statement statement_;
    private Connection connection_;
    private String dbName_;
    private String user_;
    private String password_;
    private String status_;
    
    public SqlConnection(String driver, String url, String dbName, String user, String password){
        try{
           Class.forName(driver);
           dbName_ = dbName;
           url += dbName_;
           user_ = user;
           password_ = password;
           startConnection(url);
           status_ = "Connection realizada";
        }
        catch (SQLException | ClassNotFoundException e){
            status_ = "Connection failed! - " + e.toString();
        }
    }
    
    public SqlConnection(String dbName, String user, String password){
        this("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/",
                dbName, user, password);
    }
    
    public int updateTable(String sql){
        int ret;
        
        ret = 0;
        try{
            ret = statement_.executeUpdate(sql);
            status_ = "Update succesful";
        }
        catch (SQLException e){
            status_ = "Update Failed! - " + e.toString();
        }
        return ret;
    }
    
    public ResultSet querySelect(String sql){
        ResultSet ret;
        
        try{
            ret = statement_.executeQuery(sql);
            status_ = "Query Success";
        }
        catch (SQLException e){
            status_ = "Query Failed! - " + e.toString();
            ret = null;
        }
        return ret;
    }
    
    /**
     *
     * @param url
     * @throws SQLException
     */
    
    private void startConnection(String url) throws SQLException{
        connection_ = (Connection)DriverManager.getConnection(url, user_, password_);
        statement_ = (Statement)connection_.createStatement();
    }
    
    public void startConnection(){
        String url = "jdbc:mysql://localhost:3306/" + dbName_;
        try{
            startConnection(url);
            status_ = "Connection succesful";
        }
        catch (SQLException e){
            status_ = "Connection failed! - " + e.toString();
        }
    }
    
    public void startConnection(int port){
        String url;
        url = "jdbc:mysql://localhost:" + Integer.toString(port) +"/" + dbName_;
        try{
            startConnection(url);
            status_ = "Connection succesful";
        }
        catch (SQLException e){
            status_ = "Connection failed! - " + e.toString();
        }
    }
    
    public void closeConnection(){
        try{
            connection_.close();
            status_ = "Operation succesful";
        }
        catch (SQLException e){
            status_ = "Operation Failed - " + e;
        }
    }
    
    public String getStatus(){
        return status_;
    }
}
