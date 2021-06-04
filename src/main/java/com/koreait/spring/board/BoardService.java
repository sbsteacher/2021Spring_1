package com.koreait.spring.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardMapper mapper;

    public List<BoardDomain> selBoardList() {
        return mapper.selBoardList();
    }
    public BoardDomain selBoard(BoardDTO param) {
        return mapper.selBoard(param);
    }
}
