package com.koreait.spring.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService service;

    @RequestMapping("/list")
    public String list(Model model) {
        List<BoardDomain> list = service.selBoardList();
        model.addAttribute("list", list);
        return "board/list";
    }

    @RequestMapping("/detail")
    public String detail(BoardDTO param, Model model) {
        System.out.println("iboard : " + param.getIboard());
        BoardDomain data = service.selBoard(param);
        model.addAttribute(data);
        return "board/detail";
    }

    @ResponseBody
    @RequestMapping(value="/cmtInsSel", method = RequestMethod.POST)
    public Map<String, Integer> cmtInsSel(@RequestBody BoardCmtEntity param) {
        System.out.println("param = " + param);
        Map<String, Integer> data = new HashMap();
        data.put("result", 1);
        data.put("age", 11);
        return data;
    }

    @ResponseBody
    @RequestMapping("/ddd")
    public BoardDTO ddd() {
        BoardDTO bd = new BoardDTO();
        bd.setIboard(1);
        return bd;
    }

    @ResponseBody
    @RequestMapping("/ddd2")
    public List<BoardDTO> ddd2() {
        List<BoardDTO> list = new ArrayList();

        BoardDTO bd = new BoardDTO();
        bd.setIboard(1);

        BoardDTO bd2 = new BoardDTO();
        bd2.setIboard(3);

        list.add(bd);
        list.add(bd2);

        return list;
    }

}
