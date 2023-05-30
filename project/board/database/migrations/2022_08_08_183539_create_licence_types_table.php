<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLicenceTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('licence_types', function (Blueprint $table) {
            $table->id();
            $table->string('title')->nullable();
            $table->longText('desc')->nullable();
            $table->integer('pupils')->nullable();
            $table->boolean('active')->nullable();
            $table->decimal('price', 8, 2)->nullable();
            $table->timestamps();
        });

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('licence_types');
    }
}
