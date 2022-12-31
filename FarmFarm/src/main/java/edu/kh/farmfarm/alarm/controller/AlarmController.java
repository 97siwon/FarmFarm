package edu.kh.farmfarm.alarm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kh.farmfarm.alarm.model.service.AlarmService;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService service;
	
	// 임시 알림창 확인용 페이지 이동 메서드
	@GetMapping("/temp/alarm")
	public String tempAlarm() {
		return "alarm/alarmReceiver";
	}
	
	// 로그인 확인용
	@PostMapping("/check/login")
	@ResponseBody
	public String checkLogin(HttpSession session) {
		int result = -1;
		
		if(session.getAttribute("loginMember") != null) {
			result = 0;
		}
		
		return new Gson().toJson(result);
	}
	
	// 게시글 또는 댓글의 작성자 찾기
	@PostMapping("/alarm/select/targetNo")
	@ResponseBody
	public String selectTargetNo(String type, int inputNo) {
		return new Gson().toJson(service.selectTargetNo(type, inputNo));
	}
}
