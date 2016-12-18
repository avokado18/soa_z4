package com.soa.z4.service;

import com.google.common.collect.Lists;
import com.soa.z4.entity.User;
import com.soa.z4.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public List<User> getAll() {
        return Lists.newArrayList(userRepository.findAll());
    }
    @Transactional
    public User getOne(Long id){
        return userRepository.findOne(id);
    }

    @Transactional
    public User create(User user){
        User newUser = new User();
        newUser.setFirstName(user.getFirstName());
        newUser.setLastName(user.getLastName());
        newUser.setBirthday(user.getBirthday());
        newUser.setAddress(user.getAddress());
        return userRepository.save(newUser);
    }

    @Transactional
    public void delete(Long id){
        userRepository.delete(id);
    }

    @Transactional
    public User update(Long id, User user){
        User newUser = userRepository.findOne(id);
        newUser.setFirstName(user.getFirstName());
        newUser.setLastName(user.getLastName());
        newUser.setBirthday(user.getBirthday());
        newUser.setAddress(user.getAddress());
        return userRepository.save(newUser);
    }

}
