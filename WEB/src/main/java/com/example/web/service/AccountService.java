package com.example.web.service;


import com.example.web.model.Account;

import java.util.List;

public interface AccountService {
    Account findByLoginName(String loginName);
    void addNewAccount(Account account);
    String getMaxAccountID();
    public List<Account> viewAllAccount();
    Account findById(String accountId);
    public void updateAccountById(Account account);
    public void deleteAccountById(String accountId);
}
