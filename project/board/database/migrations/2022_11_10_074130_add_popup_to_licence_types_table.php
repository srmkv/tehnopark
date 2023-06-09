<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddPopupToLicenceTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('licence_types', function (Blueprint $table) {
            $table->text('popup_html');
            $table->integer('price_year');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('licence_types', function (Blueprint $table) {
            $table->dropColumn('popup_html');
            $table->dropColumn('price_year');
        });
    }
}
