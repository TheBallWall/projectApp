package com.crackerStudents.projectApp.repos;


import com.crackerStudents.projectApp.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface UserRepo extends JpaRepository<User, UUID> {
    User findByUsername(String username);
    User findByActivationCode(String code);
    Optional<User> findById(UUID id);
}
