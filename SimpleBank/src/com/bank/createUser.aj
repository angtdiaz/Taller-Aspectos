package com.bank;

public aspect createUser {
	pointcut success() : call(* create*(..));
	after(): success() {
		System.out.println("****User created****");
		
	}
}
