package com.boots.service;

import com.boots.entity.Kpp;
import com.boots.entity.Role;
import com.boots.entity.User;
import com.boots.entity.UserDetails;
import com.boots.repository.KppRepository;
import com.boots.repository.UserDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class UserDetailsService {
    @Autowired
    UserDetailsRepository userDetailsRepository;
    @Autowired
    private KppRepository kppRepository;

    public UserDetails loadUserBySurname(String surname)  {
        UserDetails user = userDetailsRepository.findBySurname(surname);
        return user;
    }

    public UserDetails findUserById(Long userId) {
        Optional<UserDetails> userFromDb = userDetailsRepository.findById(userId);
        return userFromDb.orElse(new UserDetails());
    }

    public boolean saveUserDetail(UserDetails user) {
        UserDetails userFromDB = userDetailsRepository.findBySurnameAndName(user.getSurname(), user.getName());
        if (userFromDB != null) {
            return false;
        }
        userDetailsRepository.save(user);
        return true;
    }

    public void updateUser(UserDetails userForm, Long userID) {
        UserDetails userDetails = findUserById(userID);
        userDetails.setAge(userForm.getAge());
        userDetails.setName(userForm.getName());
        userDetails.setPost(userForm.getPost());
        userDetails.setSurname(userForm.getSurname());
        userDetailsRepository.save(userDetails);
    }
    public Kpp findKppById(Long kppId) {
        Optional<Kpp> kppFromDb = kppRepository.findById(kppId);
        return kppFromDb.orElse(new Kpp());
    }

    public void addKpp(Long kppId, Long userID) {
        UserDetails userDetails = findUserById(userID);
        Kpp kppById = findKppById(kppId);
        if(userDetails.getKpps().contains(kppById)) {
            userDetails.getKpps().remove(kppById);
            if(userDetails.getKpps().isEmpty()) {
                Date date = new Date();
                DateFormat dF = new SimpleDateFormat("hh:mm:ss");
                String dat = dF.format(date);
                userDetails.setTimeOut(dat);
            }
        }else {
            if(userDetails.getKpps().isEmpty()) {
                Date date = new Date();
                DateFormat dF = new SimpleDateFormat("hh:mm:ss");
                String dat = dF.format(date);
                userDetails.setTimeIn(dat);
            }
            userDetails.getKpps().add(kppById);
        }

        userDetailsRepository.save(userDetails);
    }

    public List<UserDetails> allUsers() {
        return userDetailsRepository.findAll();
    }

    public boolean deleteUserDetail(Long userDetailId) {
        if (userDetailsRepository.findById(userDetailId).isPresent()) {
            userDetailsRepository.deleteById(userDetailId);
            return true;
        }
        return false;
    }

    public List<Kpp> allKpp() {
        return kppRepository.findAll();
    }

}
