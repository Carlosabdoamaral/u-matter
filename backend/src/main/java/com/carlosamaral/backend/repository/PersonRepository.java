package com.carlosamaral.backend.repository;
import com.carlosamaral.backend.model.PersonModel;
import org.hibernate.mapping.Any;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.Date;

public interface PersonRepository extends JpaRepository<PersonModel, Long> {
    @Query(value = "INSERT INTO person(deleted_account, start_date, uuid, plataform_plataform_id) VALUES (:deletedAccount, :startDate, :uuid, :plataform_id)", nativeQuery = true)
    void createNewUser(
            @Param("uuid") String uuid,
            @Param("plataform_id") Long plataform_id,
            @Param("deletedAccount") Boolean deletedAccount,
            @Param("startDate") Date startDate
    );

    @Transactional
    @Modifying
    @Query(value = "UPDATE person SET deleted_account = true WHERE uuid = :person_uuid", nativeQuery = true)
    void softDeleteUser(
            @Param("person_uuid") String person_uuid
    );

    @Transactional
    @Modifying
    @Query(value = "UPDATE person SET last_block_time = last_block_time + 2, blocked_account = true WHERE person_id = :person_id", nativeQuery = true)
    void increaseBlockTime(@Param("person_id") Long person_id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE person SET blocked_account = false WHERE person_id = :person_id", nativeQuery = true)
    void desblockUser(@Param("person_id") Long person_id);
}
