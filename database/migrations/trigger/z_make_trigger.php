<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Query trigger untuk cek gerakan latihan yang duplikat dalam 1 program latihan;
        DB::unprepared("
            CREATE OR REPLACE TRIGGER check_duplikat_exercise
            BEFORE INSERT ON `workout_exercises`
            FOR EACH ROW
            BEGIN
                IF((SELECT COUNT(`exercise_id`) FROM `workout_exercises` WHERE `workout_id` = NEW.workout_id AND `exercise_id` = NEW.exercise_id) > 0)
                    THEN SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Program latihan tidak boleh memiliki gerakan yang sama lebih dari satu!';
                END IF;
            END ;
        ");

        // Query untuk mencheck apakah Pembayaran telah selesai sebelum di insert ke table memberships
        DB::unprepared("
            CREATE OR REPLACE TRIGGER check_status_invoice_membership
            BEFORE INSERT ON `memberships`
            FOR EACH ROW
            BEGIN
                DECLARE st_invc char(1);
                SELECT invoices.status INTO st_invc FROM invoices WHERE invoices.id = NEW.invoice_id;
            
                IF(st_invc IS NULL || st_invc IN ('0', '2'))
                    THEN SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Silahkan selesaikan pembayaran untuk mengaktifkan membership';
                END IF;
            END;
        ");

        // Query untuk mencheck apakah Pembayaran telah selesai sebelum di insert ke table memberships
        DB::unprepared("
            CREATE OR REPLACE TRIGGER check_status_invoice_payment
            BEFORE INSERT ON `payments`
            FOR EACH ROW
            BEGIN
                DECLARE st_invc char(1);
                SELECT invoices.status INTO st_invc FROM invoices WHERE invoices.id = NEW.invoice_id;
            
                IF(st_invc = '1')
                    THEN SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Pesanan telah selesai, payment tidak dapat ditambahkan';
                END IF;
            END;
        ");

        // trigger untuk mencheck duplikat alat sebelum insert
        DB::unprepared("
            CREATE OR REPLACE TRIGGER check_duplikat_equipment_on_equipment_exercise_before_insert
            BEFORE INSERT ON `exercise_equipments`
            FOR EACH ROW
            BEGIN
                IF(EXISTS(SELECT `exercise_equipments`.`equipment_id` FROM `exercise_equipments` WHERE `exercise_equipments`.equipment_id = NEW.equipment_id))
                    THEN SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Duplikat alat gym dalam 1 gerakan latihan';
                END IF;
            END;
        ");

        // trigger untuk mencheck duplikat alat sebelum update
        DB::unprepared("
            CREATE OR REPLACE TRIGGER check_duplikat_equipment_on_equipment_exercise_before_update
            BEFORE UPDATE ON `exercise_equipments`
            FOR EACH ROW
            BEGIN
                IF(EXISTS(SELECT `exercise_equipments`.`equipment_id` FROM `exercise_equipments` WHERE `exercise_equipments`.equipment_id = NEW.equipment_id))
                    THEN SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Duplikat alat gym dalam 1 gerakan latihan';
                END IF;
            END;
        ");

        // trigger untuk mencheck duplikat otot pada table exercise muscle sebelum update
        DB::unprepared("
            CREATE OR REPLACE TRIGGER check_duplikat_muscle_on_exercise_muscle_before_update
            BEFORE UPDATE ON `exercise_muscles`
            FOR EACH ROW
            BEGIN
                IF(EXISTS(SELECT `exercise_muscles`.`muscle_id` FROM `exercise_muscles` WHERE `exercise_muscles`.muscle_id = NEW.muscle_id))
                    THEN SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Duplikat alat gym dalam 1 gerakan latihan';
                END IF;
            END;
        ");

        // trigger untuk mencheck duplikat otot pada table exercise muscle sebelum insert
        DB::unprepared("
            CREATE OR REPLACE TRIGGER check_duplikat_muscle_on_exercise_muscle_before_insert
            BEFORE INSERT ON `exercise_muscles`
            FOR EACH ROW
            BEGIN
                IF(EXISTS(SELECT `exercise_muscles`.`muscle_id` FROM `exercise_muscles` WHERE `exercise_muscles`.muscle_id = NEW.muscle_id))
                    THEN SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Duplikat alat gym dalam 1 gerakan latihan';
                END IF;
            END;
        ");

        // trigger untuk mencheck status di-verifikasi oleh admin
        DB::unprepared("
            CREATE OR REPLACE TRIGGER check_verifikator_payment
            BEFORE UPDATE ON `payments`
            FOR EACH ROW
            BEGIN
                DECLARE level char(1);
                SELECT users.level INTO level FROM users WHERE id = NEW.verified_by;
                IF(level <> 1) THEN
                    SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Pembayaran hanya boleh diverifikasi oleh user Admin';
                END IF;
            END;
        ");

        // Trigger untuk check nilai nominal yang di-input
        DB::unprepared("
            CREATE OR REPLACE TRIGGER check_nilai_nominal
            BEFORE UPDATE ON `payments`
            FOR EACH ROW
            BEGIN
                IF(NEW.nominal < 0)
                    THEN SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Nominal yang diinput tidak boleh negatif';
                END IF;
            END;
        ");

        // Trigger untuk set status pembayaran sebelum update
        // DB::unprepared("
        //     CREATE OR REPLACE TRIGGER tr_set_status_invoice
        //     AFTER UPDATE ON `payments`
        //     FOR EACH ROW
        //     BEGIN
        //     DECLARE pnd_amount int(20);
        //     SELECT i.pending_amount INTO pnd_amount
        //     IF(NEW.status = '1') THEN
        //         IF(NEW.nominal > 0) THEN
        //     END IF;

        // ");



    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
};
