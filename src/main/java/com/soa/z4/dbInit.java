//package com.soa.z4;
//
//import com.soa.z4.entity.User;
//import com.soa.z4.service.UserService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.transaction.annotation.Transactional;
//
//import javax.annotation.PostConstruct;
//import java.util.Date;
//
//@Component
//public class dbInit {
//    @Autowired
//    private UserService userService;
//
//    @PostConstruct
//    @Transactional
//    public void init() {
//        User user = new User();
//        user.setFirstName("Ivanov");
//        user.setLastName("Ivan");
//        user.setBirthday(new Date());
//        user.setAddress("Lenina 5");
//
//        userService.create(user);
//
//        user.setFirstName("Petrov");
//        user.setLastName("Petr");
//        user.setBirthday(new Date());
//        user.setAddress("Voronezh");
//
//        userService.create(user);
//
//    }
//}
