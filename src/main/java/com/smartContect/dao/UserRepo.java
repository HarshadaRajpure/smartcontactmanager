package com.smartContect.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.smartContect.entities.User;

public interface UserRepo extends JpaRepository<User,Integer>{
	public User findByEmail(String email);
	
	@Query("select u from User u where u.email= :email")
	public User getUserByUserName(@Param("email") String email);
}
