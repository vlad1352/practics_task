package com.boots.controller;

import com.boots.entity.User;
import com.boots.entity.UserDetails;
import com.boots.repository.KppRepository;
import com.boots.service.UserDetailsService;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;
import java.io.IOException;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserDetailsService userDetailsService;


    @GetMapping("/office")
    public String office( Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        model.addAttribute("users", userDetailsService.allUsers());
        return "office";
    }

    @PostMapping("/office")
    public String  deleteUser(@RequestParam(required = true, defaultValue = "" ) Long userId,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
            userService.deleteUser(userId);
        }
        if (action.equals("deleteU")){
            userDetailsService.deleteUserDetail(userId);
        }
        return "redirect:/office";
    }

    @GetMapping("/admin/gt/{userId}")
    public String  gtUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.usergtList(userId));
        return "admin";
    }

    @GetMapping("/office/add-user")
    public String aUser(Model model) {
        model.addAttribute("userForm", new UserDetails());
        return "add-user";
    }

    @PostMapping("/office/add-user")
    public String addUser(@ModelAttribute("userForm") UserDetails userForm, Model model) {

        if (!userDetailsService.saveUserDetail(userForm)){
            model.addAttribute("usernameError", "Пользователь с таким именем уже существует");
            return "add-user";
        }

        return "redirect:/office";
    }
    
    @GetMapping("/office/{id}/editUser")
    public String editUser(@PathVariable(value = "id") Long userID, Model model) {

        model.addAttribute("user", userDetailsService.findUserById(userID));
        return "edit-user";
    }

    @PostMapping("/office/{id}/editUser")
    public String editUser(@PathVariable(value = "id") Long userID, @ModelAttribute("userForm") UserDetails userForm, Model model) {
        userDetailsService.updateUser(userForm, userID);


        return "redirect:/office";
    }

    @GetMapping("/office/{username}/addKpp")
    public String addKpp(@PathVariable(value = "username") String username, Model model) {

        model.addAttribute("user", userService.findUserByUserName(username).getUserDetails());
        model.addAttribute("allKpp", userDetailsService.allKpp());
        return "addKpp";
    }

    @PostMapping("/office/{username}/addKpp")
    public String addKpps(@PathVariable(value = "username") String username,
                          @RequestParam(required = true, defaultValue = "" ) Long kppId,
                          Model model) {
        userDetailsService.addKpp(kppId, userService.findUserByUserName(username).getUserDetails().getId());
        return "redirect:/office/{username}/addKpp";
    }
}
