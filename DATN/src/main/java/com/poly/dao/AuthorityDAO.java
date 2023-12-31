package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entities.Authority;

public interface AuthorityDAO extends JpaRepository<Authority, Integer> {
}