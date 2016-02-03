package com.hesc.user.service.impl;

import com.hesc.user.dao.UserDao;
import com.hesc.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("serService")
@Transactional
public class UserServiceImpl  implements UserService {

    @Autowired
    private UserDao userDao;


}