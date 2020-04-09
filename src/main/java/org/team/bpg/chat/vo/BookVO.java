package org.team.bpg.chat.vo;

import org.springframework.stereotype.Component;

@Component("bookVO")
public class BookVO {
	private String booknumber, bookgenre, bookrent, bookreservation, isbn;
	
	public String getBooknumber() {
		return booknumber;
	}

	public void setBooknumber(String booknumber) {
		this.booknumber = booknumber;
	}

	public String getBookgenre() {
		return bookgenre;
	}

	public void setBookgenre(String bookgenre) {
		this.bookgenre = bookgenre;
	}

	public String getBookrent() {
		return bookrent;
	}

	public void setBookrent(String bookrent) {
		this.bookrent = bookrent;
	}

	public String getBookreservation() {
		return bookreservation;
	}

	public void setBookreservation(String bookreservation) {
		this.bookreservation = bookreservation;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public BookVO() {
		System.out.println("bookVO 호출");
	}

	
	
}
