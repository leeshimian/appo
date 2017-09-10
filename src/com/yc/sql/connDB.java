package com.yc.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class connDB {
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver" ;
	private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl" ;
	private static final String NAME = "scott";
	private static final String PWD = "tiger";
	private static Connection conn ;
	
	
	public static int updateEmp(String sql,Object...parm){
		try {
			PreparedStatement p = conn.prepareStatement(sql);
			for(int i=0;i<parm.length;i++){
				p.setObject(i+1, parm[i]);
			}
			
			return p.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public static ResultSet connQuery(String sql,Object...parm){
		try {
			PreparedStatement p;
			ResultSet rs=null;
			p=conn.prepareStatement(sql);
			for(int i=0;i<parm.length;i++){
				p.setObject(i+1, parm[i]);
			}
			rs=p.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static Connection getConn(){
		conn = null;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL,NAME,PWD);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void closeConn(){
		if(conn!=null){
			try {
				conn.close();
				conn=null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
	}
	
}
