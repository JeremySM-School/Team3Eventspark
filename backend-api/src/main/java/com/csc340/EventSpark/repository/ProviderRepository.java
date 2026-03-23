package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.Provider;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProviderRepository extends JpaRepository<Provider, Long> {
    Provider findByEmail(String email);
}
