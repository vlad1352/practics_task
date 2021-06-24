package com.boots.repository;

import com.boots.entity.Kpp;
import com.boots.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KppRepository extends JpaRepository<Kpp, Long> {
    Kpp findByName(String name);
}
