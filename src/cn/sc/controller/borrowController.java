package cn.sc.controller;

import cn.sc.pojo.Book;
import cn.sc.pojo.BookType;
import cn.sc.pojo.Borrow;
import cn.sc.pojo.Reader;
import cn.sc.service.BookService;
import cn.sc.service.BookTypeService;
import cn.sc.service.BorrowService;
import cn.sc.service.ReaderService;
import cn.sc.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by SONG on 2018/11/21.
 */
@Controller
@RequestMapping("")
public class borrowController {

    @Autowired
    BookService bookService;
    @Autowired
    ReaderService readerService;
    @Autowired
    BorrowService borrowService;
    @Autowired
    BookTypeService bookTypeService;

    @RequestMapping("foreBorrow")
    public String foreBorrow(HttpServletRequest request){
        Book book = bookService.getById(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("book",book);
        return "borrow";
    }

    @RequestMapping("addBorrow")
    public String addBorrow(Book book, Borrow borrow, String reader_name, HttpServletRequest request){
        List<Book> bookList = bookService.getByMore(book);
        Reader reader = readerService.getByName(reader_name);

        Book book1 =  bookList.get(0);
        book1.setStock(book1.getStock() - borrow.getNum());   //更新库存


        borrow.setBid(book1.getId());
        borrow.setRid(reader.getId());
        borrow.setBook(book1);

        borrowService.add(borrow);
        bookService.update(book1);
        request.setAttribute("message","借阅成功!");
        return "borrow";
    }

    @RequestMapping("myBorrow")
    public String myBorrow(Page page, HttpServletRequest request){
        Reader reader = readerService.getByName(request.getParameter("name"));
        List<String> bookTypeNames = bookTypeService.getAll();
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Borrow> borrowList = borrowService.list(reader.getId());
        int total = (int) new PageInfo<>(borrowList).getTotal();
        page.setTotal(total);
        for (Borrow borrow : borrowList){
            Book book = bookService.getById(borrow.getBid());
            BookType bookType = bookTypeService.getById(book.getType_id());
            book.setBookType(bookType);
            borrow.setBook(book);
        }
        request.setAttribute("page",page);
        request.setAttribute("borrowList",borrowList);
        request.getSession().setAttribute("bookTypeNames",bookTypeNames);
        return "myBorrow";
    }

    @RequestMapping("searchBorrow")
    public String searchBorrow(Page page, String type, String content, HttpServletRequest request){
        String name = (String) request.getSession().getAttribute("name");
        Reader reader = readerService.getByName(name);
        Book book = new Book();
        if (null != type){
            BookType bookType =  bookTypeService.getByName(type);
            book.setType_id(bookType.getId());
        }else {
            book.setType_id(null);
        }

        if (null != content && content.length() > 0){
            book.setName(content);
        }else {
            book.setName(null);
        }
        List<Book> bookList =  bookService.getByMore(book);
        Borrow borrow = new Borrow();
        borrow.setRid(reader.getId());

        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Borrow> borrowList = new ArrayList<>();
        for (Book book1 : bookList){
            BookType bookType = bookTypeService.getById(book1.getType_id());
            borrow.setBid(book1.getId());
            List<Borrow> borrowList1 = borrowService.getByMore(borrow);
            for (Borrow borrow1 : borrowList1){
                book1.setBookType(bookType);
                borrow1.setBook(book1);
            }
            borrowList.addAll(borrowList1);
        }
        int total =(int) new PageInfo<>(borrowList).getTotal();
        page.setTotal(total);

        request.setAttribute("borrowList",borrowList);
        request.setAttribute("page",page);
        return "myBorrow";
    }

    @RequestMapping("reBack")
    public String reBack(Page page, HttpServletRequest request){
        Borrow borrow = borrowService.getById(Integer.parseInt(request.getParameter("id")));
        Book book = bookService.getById(borrow.getBid());
        book.setStock(book.getStock() + borrow.getNum());     //更新库存
        bookService.update(book);
        borrowService.deleteById(Integer.parseInt(request.getParameter("id")));

        String name = (String)request.getSession().getAttribute("name");
        Reader reader = readerService.getByName(name);
        List<String> bookTypeNames = bookTypeService.getAll();
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Borrow> borrowList = borrowService.list(reader.getId());
        int total = (int) new PageInfo<>(borrowList).getTotal();
        page.setTotal(total);
        for (Borrow borrow1 : borrowList){
            Book book1 = bookService.getById(borrow1.getBid());
            BookType bookType = bookTypeService.getById(book1.getType_id());
            book1.setBookType(bookType);
            borrow1.setBook(book1);
        }

        request.setAttribute("page",page);
        request.setAttribute("borrowList",borrowList);
        request.getSession().setAttribute("bookTypeNames",bookTypeNames);
        request.setAttribute("message","归还成功!");
        return "myBorrow";
    }
}
