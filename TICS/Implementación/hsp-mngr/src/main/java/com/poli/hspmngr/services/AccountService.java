package com.poli.hspmngr.services;

import com.poli.hspmngr.dto.AccountDto;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public interface AccountService {

    Boolean saveAccount (AccountDto accountDto) throws Exception;
    AccountDto getAccount (String user, String pass) throws Exception;
}
