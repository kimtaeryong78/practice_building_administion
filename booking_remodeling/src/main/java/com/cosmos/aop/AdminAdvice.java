package com.cosmos.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.client.HttpStatusCodeException;

@Component
@Aspect
public class AdminAdvice {

	@SuppressWarnings("serial")
	// @Around("execution(* com.cosmos.controller.AdminController.*(..))")
	public Object CheckAdmin(ProceedingJoinPoint pjp, HttpServletRequest req) {

		HttpSession session = req.getSession();
		String session_id = (String) session.getAttribute("id");
		String session_pwd = (String) session.getAttribute("password");
		System.out.println("check.....");
		Object result = null;
		try {
			if (session_id.equals("admin") && session_pwd.equals("admin")) {
				System.out.println("hello");
			} else {
				throw new HttpStatusCodeException(HttpStatus.UNAUTHORIZED, "NO_LOGIN") {
				};
			}
			result = pjp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return result;
	}
}
