package com.shop.app.product.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/product")
@Controller
public class ProductController {

	@GetMapping("/productDetail.do")
	public void productDetail() {}
	
	@GetMapping("/productList.do")
	public void productList() {
		
	}
	
	@PostMapping("/product/addProduct.do")
	public ResponseEntity<?> addProduct(){
		
		return null;
	}

	
}
