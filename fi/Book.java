package book;

public class Book {
	private String bookID;
	private String bookName;
	private String bookAuthor;
	private int price;
	private String bookContent;
	private String bookauthorItd;
	private String ceoComment;
	private String publisher;
	private String category;
	private String filename;
	private int quantity;
	
	public Book() {}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Book(String bookID, String bookName, String bookAuthor, int price, String bookContent, String bookauthorItd,
			String ceoComment, String publisher, String category, String filename, int quantity) {
		super();
		this.bookID = bookID;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.price = price;
		this.bookContent = bookContent;
		this.bookauthorItd = bookauthorItd;
		this.ceoComment = ceoComment;
		this.publisher = publisher;
		this.category = category;
		this.filename = filename;
		this.quantity = quantity;
	}

	public Book(String bookID, String bookName, String bookAuthor, int price, String bookContent, String bookauthorItd,
			String ceoComment, String publisher, String category, String filename) {
		super();
		this.bookID = bookID;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.price = price;
		this.bookContent = bookContent;
		this.bookauthorItd = bookauthorItd;
		this.ceoComment = ceoComment;
		this.publisher = publisher;
		this.category = category;
		this.filename = filename;
	}

	public String getBookID() {
		return bookID;
	}

	public void setBookID(String bookID) {
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

	public String getBookauthorItd() {
		return bookauthorItd;
	}

	public void setBookauthorItd(String bookauthorItd) {
		this.bookauthorItd = bookauthorItd;
	}

	public String getCeoComment() {
		return ceoComment;
	}

	public void setCeoComment(String ceoComment) {
		this.ceoComment = ceoComment;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	

	
	
	
}
