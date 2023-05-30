<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLessonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();

        Schema::create('lessons', function (Blueprint $table) {
            $table->id();
            $table->string('title')->nullable();
            $table->string('slug')->unique('slug');
            $table->longText('desc')->nullable();
            $table->timestamp('start_at')->nullable();
            $table->integer('status')->nullable();
            $table->foreignId('course_id')->nullable()->constrained();
            $table->foreignId('user_id')->nullable()->constrained();
            $table->string('pad_secret')->nullable();
            $table->longText('pad_json')->nullable();
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
        Schema::dropIfExists('lessons');
    }
}
