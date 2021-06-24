package com.boots.repository;

import com.boots.entity.User;
import com.boots.entity.UserDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDetailsRepository extends JpaRepository<UserDetails, Long> {
    UserDetails findBySurnameAndName(String surname, String name);
    UserDetails findBySurname(String surname);

}
