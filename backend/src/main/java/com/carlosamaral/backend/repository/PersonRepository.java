package com.carlosamaral.backend.repository;
import com.carlosamaral.backend.model.PersonModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.Date;

public interface PersonRepository extends JpaRepository<PersonModel, Long> {
    @Query(value = "INSERT INTO person (deleted_account, start_date, uuid, plataform_plataform_id) VALUES (:deletedAccount, :startDate, :uuid, :plataform_id)", nativeQuery = true)
    void createNewUser(
            @Param("uuid") String uuid,
            @Param("plataform_id") Long plataform_id,
            @Param("deletedAccount") Boolean deletedAccount,
            @Param("startDate") Date startDate
    );

    @Query(value = "UPDATE person SET deleted_account = true WHERE uuid = :person_uuid", nativeQuery = true)
    void softDeleteUser(
            @Param("person_uuid") String person_uuid
    );

    @Query(value = "UPDATE person SET blocked_account = true, last_block_time = :block_time WHERE person_id = :person_uuid", nativeQuery = true)
    void blockPerson(
            @Param("person_uuid") String person_uuid,
            @Param("block_time") Double block_time
    );
}
