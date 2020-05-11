package org.team.bpg.chat.vo;

import org.springframework.stereotype.Component;

@Component("bookVO")
public class BookVO {
	private String bookName, bookContents, bookWriter, bookGenre;
	private byte[] bookThum;

	public byte[] getBookThum() {
		return bookThum;
	}

	public void setBookThum(byte[] bookThum) {
		this.bookThum = bookThum;
	}

	public String getBookGenre() {
		return bookGenre;
	}

	public void setBookGenre(String bookGenre) {
		this.bookGenre = bookGenre;
	}


	
	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookContents() {
		return bookContents;
	}

	public void setBookContents(String bookContents) {
		this.bookContents = bookContents;
	}

	public String getBookWriter() {
		return bookWriter;
	}

	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}





	
	
}
