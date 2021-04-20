package bookshop;

public class Book {
	private int bookID; //1 책 아이디
	private String bookName; //2 책 제목
	private String bookAuthor; //3 저자
	private int price; //4 가격
	private String bookContent; //5 책 내용
	private String bookAuthorItd; //6 작가소개
	private String CEOcomment; //7 책방지기 코멘트
	private String publisher; //8 출판사
	private String category; //9 카테고리
	private int stock; //10 수량
	private String filename; //11 파일 올리기
	
	public Book() {}
	
	public Book(int bookID, String bookName, String bookAuthor, int price, 
				String bookContent, String bookAuthorItd, String CEOcomment, String publisher, 
				String category, int stock) {
		super();
		this.bookID = bookID; //1
		this.bookName = bookName; //2
		this.bookAuthor = bookAuthor; //3
		this.price = price; //4
		this.bookContent = bookContent; //5
		this.bookAuthorItd = bookAuthorItd; //6
		this.CEOcomment = CEOcomment; //7
		this.publisher = publisher; //8
		this.category = category; //9
		this.stock = stock; //10
				
	}
	
	public Book(int bookID, String bookName, String bookAuthor, int price, 
			String bookConetent, String bookAuthorItd, String CEOcomment, String publisher, 
			String category, int stock, String filename) {
	super();
	this.bookID = bookID; //1
	this.bookName = bookName; //2
	this.bookAuthor = bookAuthor; //3
	this.price = price; //4
	this.bookContent = bookContent; //5
	this.bookAuthorItd = bookAuthorItd; //6
	this.CEOcomment = CEOcomment; //7
	this.publisher = publisher; //8
	this.category = category; //9
	this.stock = stock; //10
	this.filename = filename; //11
}
	

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookAuthor() {
		return bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBookContent() {
		return bookContent;
	}

	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}

	public String getBookAuthorItd() {
		return bookAuthorItd;
	}

	public void setBookAuthorItd(String bookAuthorItd) {
		this.bookAuthorItd = bookAuthorItd;
	}

	public String getCEOcomment() {
		return CEOcomment;
	}

	public void setCEOcomment(String cEOcomment) {
		CEOcomment = cEOcomment;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	
	
}
