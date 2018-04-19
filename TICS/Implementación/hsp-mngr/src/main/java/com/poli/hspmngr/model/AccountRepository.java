package com.poli.hspmngr.model;

import com.poli.hspmngr.dto.AccountDto;
import org.springframework.data.repository.CrudRepository;

public interface AccountRepository extends CrudRepository<AccountDto, Integer> {

    AccountDto findAccountDtoByUsernameAndPassword(String user, String pass);
}