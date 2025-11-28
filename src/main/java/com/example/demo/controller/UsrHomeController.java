package com.example.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.FileDto;
import com.example.demo.service.FileService;
import com.example.demo.util.Util;

@Controller
public class UsrHomeController {
	
	private FileService fileService;
	
	public UsrHomeController(FileService fileService) {
		this.fileService = fileService;
	}
	
	@GetMapping("/usr/home/main")
	public String showMain() {
		return "usr/home/main";
	}
	
	@GetMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	@GetMapping("/usr/home/apiTest1")
	public String apiTest1() {
		return "usr/home/apiTest1";
	}
	
	@GetMapping("/usr/home/apiTest2")
	public String apiTest2() {
		return "usr/home/apiTest2";
	}
	
	@GetMapping("/usr/home/checkboxSubmit")
	@ResponseBody
	public String checkboxSubmit(@RequestParam(name = "chk", required = false) List<String> list) {
		
		if (list == null) {
			return Util.jsReplace("체크박스 미선택", "/");
		}
		
		for (String value : list) {
			System.out.println("checkboxValue : " + value);
		}
		
		return Util.jsReplace("전송된 체크박스 값 확인", "/");
	}
	
	@PostMapping("/usr/home/ajaxCheckbox")
	@ResponseBody
	public List<Integer> ajaxCheckbox(@RequestParam List<Integer> chkList) {
		
		for (Integer i : chkList) {
			System.out.println(i);
		}
		
		return chkList;
	}
	
	@PostMapping("/usr/home/upload")
	@ResponseBody
	public String upload(MultipartFile file) {
		if (file.isEmpty()) {
			return Util.jsReplace("파일이 선택되지 않았습니다", null);
		}
		
		try {
			this.fileService.saveFile(file);
		} catch (IOException e) {
			e.printStackTrace();
			return Util.jsReplace("파일을 업로드 하는데 문제가 발생했습니다", null);
		}
		
		return Util.jsReplace("파일 업로드 성공", "/");
	}
	
	@GetMapping("/usr/home/view")
	public String view(Model model) {
		List<FileDto> files = this.fileService.getFiles();
		
		model.addAttribute("files", files);
		
		return "usr/home/view";
	}
	
	@GetMapping("/usr/home/file/{fileId}")
	@ResponseBody
	public Resource fileLoad(Model model, @PathVariable("fileId") int id) throws IOException {
		
		FileDto fileDto = this.fileService.getFileById(id);
		
		return new UrlResource("file:" + fileDto.getSavedPath());
	}
}
