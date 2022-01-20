package com.cosmos.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class CommonExceptionAdvice {
	@ExceptionHandler(Exception.class)
	public String except(Exception e, Model model) {
		model.addAttribute("exception", e);
		e.printStackTrace();
		return "error/error_page";
	}

	@ExceptionHandler(NoHandlerFoundException.class)
	public String error404(NoHandlerFoundException e) {
		return "error/error_404";
	}
}
