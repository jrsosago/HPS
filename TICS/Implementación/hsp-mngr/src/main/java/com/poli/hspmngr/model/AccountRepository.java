package com.poli.hspmngr.model;

import com.poli.hspmngr.dto.AccountDto;

public interface AccountRepository extends CrudRepository {

    AccountDto findAccountDtoByUserAndPass(String user, String pass);
}