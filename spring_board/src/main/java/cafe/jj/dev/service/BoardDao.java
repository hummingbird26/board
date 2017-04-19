package cafe.jj.dev.service;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	public Connection getConnection() throws ClassNotFoundException, SQLException{
		Connection connection = null;
	    String dbUrl = "jdbc:mysql://127.0.0.1:3306/injava?useUnicode=true&characterEncoding=euckr";
	    String dbUser = "root";
	    String dbPw = "java0000";
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
		
		return connection;
	}
	public int insertBoard(Board board){
		System.out.println("insertBoard메서드 실행");
		return sqlSessionTemplate.insert("cafe.jj.dev.service.BoardMapper.insertBoard"
										, board);
	}
	
	public int getBoardCount(){
		System.out.println("getBoardCount메서드 실행");
	    return sqlSessionTemplate.selectOne("cafe.jj.dev.service.BoardMapper.getBoardCount");
	}
	
	public ArrayList<Board> getBoardList(int currentPage , int pagePerRow){
		
		ArrayList<Board> arb = new ArrayList<Board>();
	    Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet rs = null;
		
	    try {
			connection = this.getConnection();
		    String listSql = "SELECT board_no, board_title, board_user, board_date FROM board ORDER BY board_no DESC LIMIT ?, ?";
		    statement = connection.prepareStatement(listSql);
		    statement.setInt(1, (currentPage-1)*pagePerRow); 
		    statement.setInt(2, pagePerRow); 
		    rs = statement.executeQuery();
		    
		    while(rs.next()) {
		    	Board board = new Board();
		    	board.setBoard_no(rs.getInt("board_no"));
		    	board.setBoard_title(rs.getString("board_title"));
		    	board.setBoard_user(rs.getString("board_user"));
		    	board.setBoard_date(rs.getString("board_date"));
		    	arb.add(board);		    
		    }
			
		} catch(Exception e) {
	        e.printStackTrace();
	        
	    } finally {
	        try {rs.close();} catch(Exception e){}
	        try {statement.close();} catch(Exception e){}
	        try {connection.close();} catch(Exception e){}
	    }
	    
		return arb;
	}

	public Board getBoard(int boardNo){
		Board board = new Board();
	    Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet rs = null;
	    
	    try {
			connection = this.getConnection();
            String sql = "SELECT board_title, board_content, board_user, board_date, board_no FROM board WHERE board_no=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, boardNo);
            rs = statement.executeQuery();
            
            if(rs.next()){
            	board.setBoard_title(rs.getString("board_title"));
            	board.setBoard_content(rs.getString("board_content"));
            	board.setBoard_user(rs.getString("board_user"));
            	board.setBoard_date(rs.getString("board_date"));
            	board.setBoard_no(rs.getInt("board_no"));
            }
			
		} catch(Exception e) {
	        e.printStackTrace();
	        
	    } finally {
	        try {rs.close();} catch(Exception e){}
	        try {statement.close();} catch(Exception e){}
	        try {connection.close();} catch(Exception e){}
	    }
		
		return board;
	}

	public int deleteBoard(int boardNo, String boardPw){
		int i = 0;
		Connection connection = null;
	    PreparedStatement statement = null;
	    
	    
	    try {
	    	connection = this.getConnection();
            String sql = "DELETE FROM board WHERE board_no=? AND board_pw=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, boardNo);
            statement.setString(2, boardPw);
            if(statement.executeUpdate() == 1){
            i = 1;
            }
			
		} catch(Exception e) {
			
	        e.printStackTrace();
	        
	    } finally {
	        
	        try {statement.close();} catch(Exception e){}
	        try {connection.close();} catch(Exception e){}
	    }
		
		return i;
	}

	public Board updateBoard(int boardNo){
		int i = 0;
	    Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet rs = null;
        Board board = new Board();

		
		try {
			connection = this.getConnection();
            Class.forName("com.mysql.jdbc.Driver");
            String selectSql = "SELECT board_title, board_content,board_no FROM board WHERE board_no=?";
            statement = connection.prepareStatement(selectSql);
            statement.setInt(1, boardNo);
            rs = statement.executeQuery();
            if(rs.next()) {
                board.setBoard_title(rs.getString("board_title"));
                board.setBoard_content(rs.getString("board_content"));
                board.setBoard_no(rs.getInt("board_no"));
                
            } else {
                
            }
        } catch (Exception e) {
            e.printStackTrace();
            
        } finally {
            try {rs.close();} catch(Exception e){}
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }

		return board;
	}

	public int updateBoardAction(Board board){
	    Connection connection = null;
	    PreparedStatement statement = null;
	    int row = 0;
	    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = this.getConnection();
            String selectSql = "UPDATE board SET board_title=?, board_content=? WHERE board_no=? AND board_pw=?";
            statement = connection.prepareStatement(selectSql);
            statement.setString(1, board.getBoard_title());
            statement.setString(2, board.getBoard_content());
            statement.setInt(3, board.getBoard_no());
            statement.setString(4, board.getBoard_pw());
            row = statement.executeUpdate();
            
        } catch(Exception e) {
            e.printStackTrace();
            
        } finally {
            try {statement.close();} catch(Exception e){}
            try {connection.close();} catch(Exception e){}
        }
	    return row;
	}
}

