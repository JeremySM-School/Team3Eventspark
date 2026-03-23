package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, Long>
{
    
}
