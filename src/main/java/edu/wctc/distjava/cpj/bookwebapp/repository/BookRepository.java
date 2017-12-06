package edu.wctc.distjava.cpj.bookwebapp.repository;

import edu.wctc.distjava.cpj.bookwebapp.model.Book;
import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author jlombardo
 */
@Repository
public interface BookRepository extends JpaRepository<Book, Integer>, Serializable {
    
}
