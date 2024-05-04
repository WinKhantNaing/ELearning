package spring.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import spring.model.CourseBean;
import spring.repository.CourseRepository;

@Controller
public class CourseController {
	
	@PostMapping(value = "savecourse")
	public String saveCourse(@ModelAttribute("coursebean") CourseBean coursebean) {
		MultipartFile image = coursebean.getCourseImage();
		String UPLOAD_DIRECTORY ="D:\\images\\CourseImage"; 
		String filename = image.getOriginalFilename();
		System.out.println(UPLOAD_DIRECTORY+" "+filename); 
		
		if (!image.isEmpty()) {
	        try {
	            // Convert MultipartFile to byte array
	        	byte[] photoBytes = image.getBytes();
	        	 BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(UPLOAD_DIRECTORY + File.separator + filename)));  
	        	    stream.write(photoBytes);  
	        	    stream.flush();
	        	    stream.close();
	        	    coursebean.setCourseImagePath(UPLOAD_DIRECTORY + File.separator + filename);
	        } catch (IOException e) {
	            System.out.println("save courseimage: " + e.getMessage());
	            return "errorPage"; // Redirect to an error page
	        }
	    }
		
		CourseRepository crepo = new CourseRepository();
		int result = crepo.insertcourse(coursebean);
		System.out.println(result);
		
		return "showallcourses";
		
	}
}
