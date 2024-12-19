package com;

import java.sql.*;
public class DBUtil {
	Connection conn=null;
	Statement stat=null;
	PreparedStatement ps=null;
	ResultSet rs= null;
	int i;
	
		public Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/newmanager","root","123456");
		}catch(InstantiationException e) {
			e.printStackTrace();
		}catch(IllegalAccessException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void release() {
		try {
			if(rs!=null)
				rs.close();
			if(stat!=null)
				stat.close();
			if(conn!=null)
				conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet getResult(String sql,String[]args) {
		rs=null;
		if(conn==null) {
			conn=this.getConn();
		}
		try {
			ps=conn.prepareStatement(sql);
			for(int i=0;i<args.length;i++) {
				ps.setString(i+1, args[i]);
			}
			rs=ps.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getResult(String sql) {
		rs=null;
		if(conn==null) {
			conn=this.getConn();
		}
		try {
			stat=conn.createStatement();
			rs=stat.executeQuery(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public int getResultUpdata(String sql,String[]args) {

		if(conn==null) {
			conn=this.getConn();
		}
		try {
			ps=conn.prepareStatement(sql);
			for(int i=0;i<args.length;i++) {
				ps.setString(i+1, args[i]);
			}
			ps.setInt(1, Integer.valueOf(args[0]));
			ps.setInt(4, Integer.valueOf(args[3]));
			System.out.println(ps.toString());
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	public int getResultUpdata(String sql) {
		rs=null;
		if(conn==null) {
			conn=this.getConn();
		}
		try {
			stat=conn.createStatement();
			i = stat.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	public int getResultUpdata2(String sql,String[]args) {

		if(conn==null) {
			conn=this.getConn();
		}
		try {
			ps=conn.prepareStatement(sql);
			for(int i=0;i<args.length;i++) {
				ps.setString(i+1, args[i]);
			}
			ps.setInt(3, Integer.valueOf(args[2]));
			System.out.println(ps.toString());
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	public int getResultUpdata2(String sql) {
		rs=null;
		if(conn==null) {
			conn=this.getConn();
		}
		try {
			stat=conn.createStatement();
			i = stat.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	public int getResultDel(String sql,String[]args) {

		if(conn==null) {
			conn=this.getConn();
		}
		try {
			ps=conn.prepareStatement(sql);
			for(int i=0;i<args.length;i++) {
				ps.setString(i+1, args[i]);
			}
			i = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	public int getResultDel(String sql) {
		rs=null;
		if(conn==null) {
			conn=this.getConn();
		}
		try {
			stat=conn.createStatement();
			i = stat.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	public int executeSql(String sql) {
		return 0;
	}
}
