package com.poli.hspmngr.services;

import com.poli.hspmngr.dto.AccountDto;
import com.poli.hspmngr.model.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AccountServiceImpl implements AccountService {

    @Autowired
    AccountRepository accountRepository;

    @Override
    public Boolean saveAccount (AccountDto accountDto) {
        Boolean accountCreated = false;
        try {
            accountRepository.save(accountDto);
            accountCreated = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accountCreated;
    }

    @Override
    public AccountDto getAccount (String user, String pass) {
        AccountDto accountDto = null;
        try {
            accountDto = accountRepository.findAccountDtoByUsernameAndPassword(user, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accountDto;
    }
}
