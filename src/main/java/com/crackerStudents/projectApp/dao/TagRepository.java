package com.crackerStudents.projectApp.dao;

import com.crackerStudents.projectApp.domain.Pack;
import com.crackerStudents.projectApp.domain.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface TagRepository extends JpaRepository<Tag, Integer> {
    Set<Tag> findAllByPacksIn(List<Pack> packs);
}
