<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('equipment_joins', function (Blueprint $table) {
            $table->foreignId('olympus_equipment_id')->references('id')->on('olympus_equipments')->onUpdate('cascade')->onDelete('cascade');
            $table->foreignId('equipment_id')->references('id')->on('equipments')->onUpdate('cascade')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('equipment_joins');
    }
};
