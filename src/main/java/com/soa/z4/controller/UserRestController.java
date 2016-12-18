package com.soa.z4.controller;

import com.soa.z4.entity.User;
import com.soa.z4.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

import static org.springframework.http.HttpStatus.NO_CONTENT;

@RestController
@RequestMapping("/rest/users")
public class UserRestController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    @ResponseBody
    public List<User> getAll() {
        return userService.getAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public User getOne(@PathVariable Long id) {
        return userService.getOne(id);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    @ResponseStatus(NO_CONTENT)
    public void delete(@PathVariable Long id) {
        userService.delete(id);
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public User create(@RequestBody User user) {
        return userService.create(user);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public User update(@PathVariable Long id,
                       @RequestBody User user) {
        return userService.update(id, user);
    }
}
