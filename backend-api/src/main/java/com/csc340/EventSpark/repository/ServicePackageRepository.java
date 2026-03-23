package com.csc340.EventSpark.repository;

import com.csc340.EventSpark.entity.ServicePackage;
import com.csc340.EventSpark.entity.ServicePackage.PackageStatus;
import com.csc340.EventSpark.entity.ServicePackage.PackageCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ServicePackageRepository extends JpaRepository<ServicePackage, Long> {
    @Query(value = "SELECT p.* FROM service_packages p WHERE p.provider_id = :providerId", nativeQuery = true)
    List<ServicePackage> findByProviderId(Long providerId);

    List<ServicePackage> findByStatus(PackageStatus status);

    List<ServicePackage> findByCategory(PackageCategory category);
}
