package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileDto {
	private int id;
	private String regDate;
	private String originName;
	private String savedName;
	private String savedPath;
}
