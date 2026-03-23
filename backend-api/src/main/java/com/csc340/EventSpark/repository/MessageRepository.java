package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {
    @Query(value = "SELECT m.* FROM messages m WHERE m.thread_id = :threadId ORDER BY m.created_at ASC", nativeQuery = true)
    List<Message> findByThreadId(Long threadId);
}