package kr.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.board.entity.Member;
import kr.board.entity.Repository;
import kr.board.mapper.MemberMapper;

@Controller
public class UploadController {
   @Autowired
   private MemberMapper memberMapper;
   
   // 이미지 업로드 페이지
      @GetMapping("imageupload")
      public String imageupload() {
         return "imageupload";
      }
   
   // 결과 확인 페이지
   @GetMapping("objectdetection")
   public String objectdetection() {
      return "objectdetection";
   }
   
   // 라벨 수정 페이지
      @GetMapping("labeledit")
      public String labeledit() {
         return "labeledit";
      }
   
   // DB에 이미지 저장
   @GetMapping("downLoad.do")
   public void downLoad(Member m, Repository r) {

      // memberMapper.downLoad(r);

   }
   
   // repository DB 저장
   @ResponseBody
   @PostMapping("repositorySave")
   public String repositorySave(@RequestBody List<HashMap<String, Object>> param, HttpSession session) {
      System.out.println("통신 o");
      System.out.println(param);
      
      int user_idx = ((Member)session.getAttribute("mvo")).getId();
      String category = "";
      String detected_object = "";
      String image_path = "";
      String result_path = "";

      
      System.out.println("세션값: " + user_idx);
      
      Gson gson = new Gson();
      List<Repository> list = new ArrayList<>();
      for(HashMap<String, Object> i : param) {
         
         // Repository r = gson.fromJson(i.toString(), Repository.class);
         System.out.println(i.getClass().getSimpleName());
         
         for ( String key : i.keySet() ) {
             System.out.println(key + ": " + i.get(key));
             if(key.equals("category")) {
                category = (String)i.get(key);
             }
             else if(key.equals("detected_object")) {
                detected_object = (String)i.get(key);
             }
             else if(key.equals("image_path")) {
                image_path = (String)i.get(key);
             }
             else if(key.equals("result_path")) {
                result_path = (String)i.get(key);
             }
         }
         
         Repository r = new Repository();
         r.setCategory(category);
         r.setDetected_object(detected_object);
         r.setImage_path(image_path);
         r.setResult_path(result_path);
         r.setUser_idx(user_idx);
         
         // System.out.println(r.toString());
         
         list.add(r);
      }
      
      memberMapper.downLoad(list);
      
      return "repository success";
   }
   
   
}