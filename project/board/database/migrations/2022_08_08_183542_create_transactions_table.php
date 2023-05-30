<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('transactions', function (Blueprint $table) {
            $table->id();
            $table->decimal('amount', 8, 2)->nullable();
            $table->string('tx')->nullable();
            $table->enum('type', ["deposit","buy"]);
            $table->string('desc')->nullable();
            $table->foreignId('user_id')->nullable()->constrained();
            $table->foreignId('licence_id')->nullable()->constrained();
            $table->enum('status', ["pending","successful","failed"]);
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
        Schema::dropIfExists('transactions');
    }
}
