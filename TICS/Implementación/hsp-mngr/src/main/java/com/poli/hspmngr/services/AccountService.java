package com.poli.hspmngr.services;

import com.poli.hspmngr.dto.AccountDto;

public interface AccountService {

    Boolean saveAccount (AccountDto accountDto) throws Exception;
    AccountDto getAccount (String user, String pass) throws Exception;
}
