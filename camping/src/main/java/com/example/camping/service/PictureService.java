package com.example.camping.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.camping.repository.PictureRepository;


@Service
public class PictureService {

	@Autowired
	private PictureRepository picRepository;
	
	public void delete(Long pic_num) {
		picRepository.deleteById(pic_num);
	}
}
