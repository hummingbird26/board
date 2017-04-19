package cafe.jj.dev.service;


public class Board {

	private int board_no;
	private String board_pw;
	private String board_title;
	private String board_content;
	private String board_user;
	private String board_date;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		System.out.println(board_no);
		this.board_no = board_no;
	}
	public String getBoard_pw() {
		return board_pw;
	}
	public void setBoard_pw(String board_pw) {
		System.out.println(board_pw);
		this.board_pw = board_pw;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		System.out.println(board_title);
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		System.out.println(board_content);
		this.board_content = board_content;
	}
	public String getBoard_user() {
		return board_user;
	}
	public void setBoard_user(String board_user) {
		System.out.println(board_user);
		this.board_user = board_user;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		System.out.println(board_date);
		this.board_date = board_date;
	}
	
    @Override
    public String toString() {
        return super.toString();
    }

}
