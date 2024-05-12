package spring.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.model.CourseBean;
import spring.repository.ConnectionClass;
import spring.repository.CourseRepository;

@Controller
public class CourseController {
	
	@GetMapping(value = "/")
	public String home() {
		return "indexheader";
	}
	
	@GetMapping(value = "showcourses")
	public String showall(Model m) {
		CourseRepository cr = new CourseRepository();
		List<CourseBean> courseLst = new ArrayList<>();
		courseLst = cr.getAllCourse();
		m.addAttribute("courseLst",courseLst);
		return "showallcourses";
		
	}
	
	@GetMapping(value = "addcourse")
	public ModelAndView addcourse() {
		return new ModelAndView("addcourse","coursebean", new CourseBean());
	}
	
	@PostMapping(value = "savecourse")
	public String saveCourse(@ModelAttribute("coursebean") CourseBean coursebean) {
		MultipartFile image = coursebean.getCourseImage();
		String UPLOAD_DIRECTORY ="D:\\PFC online class\\EclipseWorkspace\\ELearningProject\\src\\main\\webapp\\resources\\images\\logoimg"; 
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
	        	    String url = UPLOAD_DIRECTORY + File.separator + filename;
	                int index = url.indexOf("resources");
	                String extractedPath = index >= 0 ? url.substring(index) : "did when it was false.";
	        	    coursebean.setCourseImagePath(extractedPath);
	        } catch (IOException e) {
	            System.out.println("save courseimage: " + e.getMessage());
	            return "errorPage"; // Redirect to an error page
	        }
	    }
		
		CourseRepository crepo = new CourseRepository();
		int result = crepo.insertcourse(coursebean);
		System.out.println(result);
		
		return "redirect:showcourses";
		
	}
	
	@GetMapping(value="updateCourse")
	public ModelAndView updatecourse(@RequestParam("cid") int courseId,Model m) {
		CourseBean cbean = null;
		cbean = new CourseBean();
		CourseRepository crepo = new CourseRepository();
		cbean = crepo.getOneCourse(courseId);
		m.addAttribute("cbean",cbean);
		return new ModelAndView("updateCourse","courseUpdateBean", new CourseBean());
		
	}
	
	@PostMapping(value= "saveupdatecourse")
	public String savecourse(@ModelAttribute("courseUpdateBean") CourseBean coursebean) {
		
		MultipartFile image = coursebean.getCourseImage();
		String UPLOAD_DIRECTORY ="D:\\PFC online class\\EclipseWorkspace\\ELearningProject\\src\\main\\webapp\\resources\\images\\logoimg"; 
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
	        	    String url = UPLOAD_DIRECTORY + File.separator + filename;
	        	    int index = url.indexOf("resources");
	                String extractedPath = index >= 0 ? url.substring(index) : "did when it was false.";
	        	    coursebean.setCourseImagePath(extractedPath);
	        } catch (IOException e) {
	            System.out.println("save courseimage: " + e.getMessage());
	            return "errorPage"; // Redirect to an error page
	        }
	    }
		
		CourseRepository crepo = new CourseRepository();
		int result = crepo.updatecourse(coursebean);
		
		if(result > 0) {
			System.out.println("update success!!");
		} else {
			System.out.println("update fail!!");
		}
		return "redirect:showcourses";
		
	}
	
	@GetMapping(value="deletecourse")
	public String deleteCourse(@RequestParam("cid") int courseId) {
		int result = 0;
		CourseRepository crepo = new CourseRepository();
		result = crepo.delete(courseId);
		
		if(result > 0 ) {
			System.out.print("delete success!!");
		} else {
			System.out.print("delete fail!!");
		}
		
		return "redirect:showcourses";
		
	}
}
