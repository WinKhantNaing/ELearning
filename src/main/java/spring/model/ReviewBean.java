package spring.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewBean {
private String viewname;
private MultipartFile file;
private String image;
private int ratingview;
private String commentview;
}
