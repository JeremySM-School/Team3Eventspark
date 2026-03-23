package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.EventPackage;
import com.csc340.EventSpark.entity.EventPackage.PackageStatus;
import com.csc340.EventSpark.entity.EventPackage.PackageCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface EventPackageRepository extends JpaRepository<EventPackage, Long> {
    @Query(value = "SELECT p.* FROM event_packages p WHERE p.provider_id = :providerId", nativeQuery = true)
    List<EventPackage> findByProviderId(Long providerId);

    List<EventPackage> findByStatus(PackageStatus status);

    List<EventPackage> findByCategory(PackageCategory category);
}
