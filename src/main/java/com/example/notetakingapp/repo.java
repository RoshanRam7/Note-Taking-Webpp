package com.example.notetakingapp;

import org.springframework.data.jpa.repository.JpaRepository;

public interface repo extends JpaRepository<note, Long> {
	
	
}
