package com.example.demo.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;

import com.example.demo.dto.NotificationMessage;
import com.example.demo.service.NotificationService;

@Controller
public class NotificationController {

	private final NotificationService notificationService;
	
	public NotificationController(NotificationService notificationService) {
		this.notificationService = notificationService;
	}
	
	@MessageMapping("/send")
    public void send(NotificationMessage message) {
        this.notificationService.sendNotification(message);
    }
}
