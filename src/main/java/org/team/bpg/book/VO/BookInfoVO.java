package org.team.bpg.book.VO;

public class BookInfoVO {
	private String isbn;
	private String bookName;
	private String bookWriter;
	private String bookPublisher;
	private String bookDate;
	private String bookNumber;
	private String bookGenre;
	private String bookRent;
	private String bookReservation;
	private int bookScore;
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public String getBookDate() {
		return bookDate;
	}
	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}
	public String getBookNumber() {
		return bookNumber;
	}
	public void setBookNumber(String bookNumber) {
		this.bookNumber = bookNumber;
	}
	public String getBookGenre() {
		return bookGenre;
	}
	public void setBookGenre(String bookGenre) {
		this.bookGenre = bookGenre;
	}
	public String getBookRent() {
		return bookRent;
	}
	public void setBookRent(String bookRent) {
		this.bookRent = bookRent;
	}
	public String getBookReservation() {
		return bookReservation;
	}
	public void setBookReservation(String bookReservation) {
		this.bookReservation = bookReservation;
	}
	public int getBookScore() {
		return bookScore;
	}
	public void setBookScore(int bookScore) {
		this.bookScore = bookScore;
	}
	@Override
	public String toString() {
		return "BookInfoVO [isbn=" + isbn + ", bookName=" + bookName + ", bookWriter=" + bookWriter + ", bookPublisher="
				+ bookPublisher + ", bookDate=" + bookDate + ", bookNumber=" + bookNumber + ", bookGenre=" + bookGenre
				+ ", bookRent=" + bookRent + ", bookReservation=" + bookReservation + ", bookScore=" + bookScore + "]";
	}
	
}
	