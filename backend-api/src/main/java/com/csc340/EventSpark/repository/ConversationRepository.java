package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.Conversation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ConversationRepository extends JpaRepository<Conversation, Long> {
    @Query(value = "SELECT c.* FROM conversations c WHERE c.provider_id = :providerId", nativeQuery = true)
    List<Conversation> findByProviderId(Long providerId);

    @Query(value = "SELECT c.* FROM conversations c WHERE c.customer_id = :customerId", nativeQuery = true)
    List<Conversation> findByCustomerId(Long customerId);
}
