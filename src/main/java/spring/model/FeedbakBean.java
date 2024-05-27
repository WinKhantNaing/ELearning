package spring.model;

import java.time.LocalDate;

public class FeedbakBean {
private int rating;
private String comment;
private LocalDate date;
public int getRating() {
	return rating;
}
public void setRating(int rating) {
	this.rating = rating;
}
public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
}
public LocalDate getDate() {
	return date;
}
public void setDate(LocalDate date) {
	this.date = date;
}


}
