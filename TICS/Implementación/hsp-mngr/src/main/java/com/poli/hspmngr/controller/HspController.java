package com.poli.hspmngr.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/manager")
public class HspController {

    @RequestMapping("/health")
    public String health() {
        return "OK";
    }
}
