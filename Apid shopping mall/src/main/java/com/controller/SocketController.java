package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SocketController {

	@RequestMapping(value = "/chat")
	public String chat() {	
		return "chat";
	}
	
	
	@RequestMapping(value = "/singleTetris")
	public String singleTetris() {	
		return "singleTetris";
	}
	
	@RequestMapping(value = "/multiTetris")
	public String multiTetris() {	
		return "multiTetris";
	}
		
	
}
