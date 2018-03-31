package com.poli.hspmngr.controller;

import com.poli.hspmngr.dto.AccountDto;
import com.poli.hspmngr.services.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/manager")
public class HspController {

    @Autowired
    AccountService accountService;

    @GetMapping("/health")
    public String health() { return "OK"; }

    @PostMapping(value = "/create")
    public Boolean createAccount(AccountDto accountDto) {
        Boolean response = false;
        try {
            response = accountService.saveAccount(accountDto);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    @GetMapping(value = "/get")
    public AccountDto getAccount(@RequestParam(value = "user") String user,
                                 @RequestParam(value = "pass") String pass) {
        AccountDto accountDto = null;
        try {
            accountDto = accountService.getAccount(user, pass);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return accountDto;
    }
}
