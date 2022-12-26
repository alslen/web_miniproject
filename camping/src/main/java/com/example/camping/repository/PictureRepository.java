package com.example.camping.repository;

import org.springframework.data.jpa.repository.JpaRepository;


import com.example.camping.model.Picture;

public interface PictureRepository extends JpaRepository<Picture, Long>{

	

}
