package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.reactive.function.client.WebClient;

@Controller
public class ApiController {

	@Value("${custom.api.key}")
	private String apiKey;

	private WebClient webClient;

	public ApiController(WebClient webClient) {
		this.webClient = webClient;
	}

	@GetMapping("/usr/api/apiTest3")
	public String apiTest3(Model model) {

		String url = "apis.data.go.kr/6300000/mdlcnst/getmdlcnst";

		Map<String, Object> response =
	            this.webClient.get()
	                    .uri(uriBuilder -> uriBuilder
	                        .path(url)
	                        .queryParam("serviceKey", this.apiKey)
	                        .queryParam("numOfRows", 10)
	                        .queryParam("pageNo", 1)
	                        .build())
	                    .retrieve()
	                    .bodyToMono(Map.class)
	                    .block();
		
		List<Map<String, Object>> items =
	            (List<Map<String, Object>>)
	            ((Map<String, Object>) ((Map<String, Object>) response.get("response")).get("body")).get("items");
		
		model.addAttribute("mdlcnst", items);

		return "usr/home/apiTest3";
	}
}
