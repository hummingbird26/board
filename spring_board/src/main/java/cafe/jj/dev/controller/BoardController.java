package cafe.jj.dev.controller;
 
import java.util.ArrayList;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.jj.dev.service.Board;
import cafe.jj.dev.service.BoardDao;

@Controller
public class BoardController {
    @Autowired
    private BoardDao boardDao;
    
    @RequestMapping(value="/boardModify", method = RequestMethod.GET)
    public String boardModify(Model model
    		,@RequestParam(value="boardNo", required=true) int board_no){
    	Board board = boardDao.getBoard(board_no);
    	model.addAttribute("board", board);
    	return "boardModify";
    }
    
    @RequestMapping(value="/boardModify", method = RequestMethod.POST)
    public String boardModify(Board board){
    	boardDao.updateBoardAction(board);
    	return "redirect:/boardView?boardNo="+board.getBoard_no();
    }
    // �� ���� �� ��û(��й�ȣ �Է� ��)
    @RequestMapping(value="/boardRemove", method = RequestMethod.GET)
    public String boardRemove(@RequestParam(value="boardNo", required=true) int board_no) {
        return "boardRemove";
    }
    // �� ���� ��û
    @RequestMapping(value="/boardRemove", method = RequestMethod.POST)
    public String boardRemove(@RequestParam(value="boardNo", required=true) int board_no
                            , @RequestParam(value="boardPw", required=true) String board_pw) {
        boardDao.deleteBoard(board_no, board_pw);
        return "redirect:/boardList";
    }
    
    // �� �� ���� ��û 
    @RequestMapping(value="/boardView", method = RequestMethod.GET)
    public String boardView(Model model
                            , @RequestParam(value="boardNo", required=true) int board_no) {
        Board board = boardDao.getBoard(board_no);
        model.addAttribute("board", board);
        return "/boardView";
    }
    
    // ����Ʈ ��û
    @RequestMapping(value="/boardList", method = RequestMethod.GET)
    public String boardList(Model model
                            , @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
        int totalRowCount = boardDao.getBoardCount();
        int pagePerRow = 10;
        int lastPage = (int)(Math.ceil(totalRowCount / pagePerRow));
        ArrayList<Board> list = boardDao.getBoardList(currentPage, pagePerRow);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalRowCount", totalRowCount);
        model.addAttribute("lastPage", lastPage);
        model.addAttribute("list", list);
        return "/boardList";
    }
    
    
    // �Է�(�׼�) ��û
    @RequestMapping(value="/boardAdd", method = RequestMethod.POST)
    public String boardAdd(Board board) {
        System.out.println(board);
        boardDao.insertBoard(board);
        return "redirect:/boardList"; // ���Է��� "/boardList"�� �����̷�Ʈ(���û)
    }
    // �Է������� ��û
    @RequestMapping(value="/boardAdd", method = RequestMethod.GET)
    public String boardAdd() {
        System.out.println("boardAdd �� ��û");
        return "boardAdd";
    }
}
