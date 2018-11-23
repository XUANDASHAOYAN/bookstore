package cn.sc.controller;

import cn.sc.pojo.Book;
import cn.sc.pojo.BookType;
import cn.sc.service.BookService;
import cn.sc.service.BookTypeService;
import cn.sc.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by SONG on 2018/11/20.
 */
@Controller
@RequestMapping("")
public class bookController {

    @Autowired
    BookService bookService;
    @Autowired
    BookTypeService bookTypeService;


    @RequestMapping("listBook")
    public String listBook(Page page, HttpServletRequest request){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Book> bookList = bookService.list();
        int total =  (int) new PageInfo<>(bookList).getTotal();
        page.setTotal(total);
        List<String> bookTypeNames = bookTypeService.getAll();
        List<String> authors = bookService.getAllAuthor();
        for (Book book : bookList){
            BookType bookType = bookTypeService.getById(book.getType_id());
            book.setBookType(bookType);
        }

        request.setAttribute("page",page);
        request.setAttribute("bookList",bookList);
        request.getSession().setAttribute("bookTypeNames",bookTypeNames);
        request.getSession().setAttribute("authors",authors);
        return "listBook";
    }

    @RequestMapping("editBook")
    public String editBook(HttpServletRequest request){
        Book book = bookService.getById(Integer.parseInt(request.getParameter("id")));
        BookType bookType = bookTypeService.getById(book.getType_id());
        book.setBookType(bookType);
        request.setAttribute("book",book);
        return "editBook";
    }

    @RequestMapping("updateBook")
    public String updateBook(Book book, String typeName){
        if (bookTypeService.getById(book.getType_id()).getName() != typeName){
            BookType bookType = new BookType();
            bookType.setId(book.getType_id());
            bookType.setName(typeName);
            bookTypeService.update(bookType);
        }
        bookService.update(book);
        return "redirect: listBook";
    }

    @RequestMapping("addBook")
    public String addBook(){
        return "addBook";
    }

    @RequestMapping("add_Book")
    public String add_Book(Book book, String typeName){
        BookType bookType =  bookTypeService.getByName(typeName);
        book.setType_id(bookType.getId());
        bookService.insert(book);
        return "redirect: listBook";
    }

    @RequestMapping("deleteBook")
    public String deleteBook(HttpServletRequest request){
        bookService.deleteById(Integer.parseInt(request.getParameter("id")));
        return "redirect: listBook";
    }

    @RequestMapping("searchBook")
    public String searchBook(Page page, String type, String author, String NameAndISBN, String content, String addOrSearch, HttpServletRequest request){
        if (addOrSearch.equals("add")){
            return "redirect: addBook";
        }else {
            Book book = new Book();
            if (null != author){
                book.setAuthor(author);
            }else {
                book.setAuthor(null);
            }
            if (null != type){
                BookType bookType =  bookTypeService.getByName(type);
                book.setType_id(bookType.getId());
            }else {
                book.setType_id(null);
            }

            if (NameAndISBN.equals("name")){
                if (null != content && content.length() > 0){
                    book.setName(content);
                }else {
                    book.setName(null);
                }
            }else{
                if (null != content && content.length() > 0){
                    book.setISBN(content);
                }else {
                    book.setISBN(null);
                }
            }

            PageHelper.offsetPage(page.getStart(),page.getCount());
            List<Book> bookList =  bookService.getByMore(book);
            page.setTotal((int) new PageInfo<>(bookList).getTotal());

            if (bookList != null){
                for (Book book1 : bookList){
                    BookType bookType1 = bookTypeService.getById(book1.getType_id());
                    book1.setBookType(bookType1);
                }
            }
            request.setAttribute("bookList",bookList);
            request.setAttribute("page",page);
            return "listBook";
        }
    }

}
