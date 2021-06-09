package com.koreait.spring.user;

import org.apache.commons.io.FilenameUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class UserService {
    @Autowired
    private UserMapper mapper;

    @Autowired
    private HttpSession session;

    public String login(UserEntity param) {
        UserEntity result = mapper.selUser(param);
        if(result == null) { //아이디 없음
            return "/user/login?err=1";
        } else if(BCrypt.checkpw(param.getUpw(), result.getUpw())) { //로그인 성공
            //세션처리
            result.setUpw(null);
            session.setAttribute("loginUser", result);
            return "/board/list";
        } else { //비밀번호 틀림
            return "/user/login?err=2";
        }
    }

    public int join(UserEntity param) {
        String cryptPw = BCrypt.hashpw(param.getUpw(), BCrypt.gensalt());
        param.setUpw(cryptPw);
        return mapper.insUser(param);
    }

    public String uploadProfile(MultipartFile img) {
        UserEntity loginUser = (UserEntity) session.getAttribute("loginUser");
        final String PATH = "D:/springImg/" + loginUser.getIuser();

        File folder = new File(PATH);
        folder.mkdirs();

        String ext = FilenameUtils.getExtension(img.getOriginalFilename());
        String fileNm = UUID.randomUUID().toString() + "." + ext;

        File target = new File(PATH + "/" + fileNm);
        try {
            img.transferTo(target);

            //이전 이미지 삭제
            File delFile = new File(PATH + "/" + loginUser.getProfileImg());
            if(delFile.exists()) {
               delFile.delete();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        UserEntity param = new UserEntity();
        param.setIuser(loginUser.getIuser());
        param.setProfileImg(fileNm);
        mapper.updUser(param);

        loginUser.setProfileImg(fileNm);
        return "/user/profile";
    }
}